class CreateLedgerEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :ledger_entries do |t|
      t.string :kind, null: false
      t.decimal :delta
      t.string :balance_after, null: false
      t.string :decimal
      t.string :memo
      t.string :ref_type
      t.integer :ref_id
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
