class CreateRewardItems < ActiveRecord::Migration[8.1]
  def change
    create_table :reward_items do |t|
      t.string :title
      t.string :description
      t.decimal :price_rcr
      t.string :category
      t.decimal :stock_qty
      t.boolean :is_unlimited
      t.boolean :is_active

      t.timestamps
    end
  end
end
