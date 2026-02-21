class CreateRewardItems < ActiveRecord::Migration[8.1]
  def change
    create_table :reward_items do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :category
      t.decimal :stock_qty, null: false
      t.boolean :is_active
      t.boolean :is_unlimited
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
