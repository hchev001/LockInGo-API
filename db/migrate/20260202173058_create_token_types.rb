class CreateTokenTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :token_types do |t|
      t.string :code
      t.string :name
      t.string :color
      t.string :icon
      t.boolean :is_active

      t.timestamps
    end
  end
end
