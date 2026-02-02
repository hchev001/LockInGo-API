class CreateExchangeRates < ActiveRecord::Migration[8.1]
  def change
    create_table :exchange_rates do |t|
      t.integer :token_type_id
      t.string :mode
      t.json :params
      t.boolean :is_active
      t.datetime :valid_from
      t.datetime :valid_to

      t.timestamps
    end
  end
end
