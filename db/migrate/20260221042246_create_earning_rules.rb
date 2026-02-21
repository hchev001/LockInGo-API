class CreateEarningRules < ActiveRecord::Migration[8.1]
  def change
    create_table :earning_rules do |t|
      t.string :rule_type, null: false
      t.integer :daily_cap
      t.string :rounding
      t.json :params
      t.references :task, null: false, foreign_key: true
      t.references :token_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
