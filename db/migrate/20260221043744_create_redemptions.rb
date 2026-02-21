class CreateRedemptions < ActiveRecord::Migration[8.1]
  def change
    create_table :redemptions do |t|
      t.string :status, null: false
      t.decimal :qty, null: false
      t.decimal :cost, null: false
      t.datetime :requested_at
      t.datetime :fulfilled_at
      t.datetime :canceled_at
      t.string :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
