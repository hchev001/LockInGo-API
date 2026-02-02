class CreateLedgerEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :ledger_entries do |t|
      t.integer :wallet_id
      t.string :ts
      t.string :delta
      t.decimal :balance_after
      t.string :kind
      t.string :ref_type
      t.integer :ref_id
      t.string :memo

      t.timestamps
    end
  end
end
