class CreateWallets < ActiveRecord::Migration[8.1]
  def change
    create_table :wallets do |t|
      t.integer :user_id
      t.string :currency_code
      t.decimal :balance

      t.timestamps
    end
  end
end
