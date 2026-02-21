class CreateWallets < ActiveRecord::Migration[8.1]
  def change
    create_table :wallets do |t|
      t.decimal :balance
      t.string :currency_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
