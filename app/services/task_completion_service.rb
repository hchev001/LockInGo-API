# frozen_string_literal: true

class TaskCompletionService
  #what does this line do?
  class AlreadyCompletedError < StandardError; end

  def initialize(task:, user:, now: Time.current)
    @task = task
    @user = user
    @now = now
  end

  def call
    raise AlreadyCompletedError, "Task is already completed" if @task.completed?

    ActiveRecord::Base.transaction do
      @task.update!(completed_at: @now)
      award_tokens_for_task(@task)
    end
  end

  private
  def award_tokens_for_task(task)
  task.earning_rules.each do |earning_rule|
    tokens = calculate_tokens(earning_rule).to_i
    next if tokens <= 0

    wallet = @user.wallets.find_or_create_by!(currency_code: earning_rule.token_type.code)
    new_balance = wallet.balance.to_d + tokens.to_d

    LedgerEntry.create!(
      wallet: wallet,
      delta: tokens,
      kind: "earn",
      balance_after: new_balance.to_s("F"),
      ref_type: "Task",
      ref_id: task.id
    )

    wallet.update!(balance: new_balance)
  end
end

def calculate_tokens(earning_rule)
  return earning_rule.params["amount"] if earning_rule.rule_type == "base_completion"
  0
end
end
