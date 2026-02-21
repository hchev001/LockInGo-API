class CreateExchangeRates < ActiveRecord::Migration[8.1]
  def change
    create_table :exchange_rates do |t|
      t.string :mode, null: false
      t.datetime :valid_from
      t.datetime :valid_to
      t.boolean :is_active
      t.json :params
      t.references :token_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
