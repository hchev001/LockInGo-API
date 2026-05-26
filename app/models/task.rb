class Task < ApplicationRecord
  belongs_to :user
  # describes the rules for how much the task is worth in terms of tokens
  has_many :earning_rules, dependent: :destroy
end
