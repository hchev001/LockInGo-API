class CreateTokenTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :token_types do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :color
      t.string :icon
      t.boolean :is_active

      t.timestamps
    end
  end
end
