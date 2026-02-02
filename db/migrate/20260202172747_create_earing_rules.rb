class CreateEaringRules < ActiveRecord::Migration[8.1]
  def change
    create_table :earing_rules do |t|
      t.integer :task_id
      t.integer :token_type_id
      t.string :rule_type
      t.json :params
      t.string :rounding
      t.integer :daily_cap

      t.timestamps
    end
  end
end
