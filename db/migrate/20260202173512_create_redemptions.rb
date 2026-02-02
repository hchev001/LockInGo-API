class CreateRedemptions < ActiveRecord::Migration[8.1]
  def change
    create_table :redemptions do |t|
      t.integer :user_id
      t.integer :reward_item_id
      t.decimal :qty
      t.decimal :cost_rcr
      t.string :status
      t.datetime :requested_at
      t.datetime :fulfilled_at
      t.datetime :canceled_at
      t.string :notes

      t.timestamps
    end
  end
end
