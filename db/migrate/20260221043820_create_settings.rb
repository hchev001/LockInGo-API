class CreateSettings < ActiveRecord::Migration[8.1]
  def change
    create_table :settings do |t|
      t.string :key, null: false, index: { unique: true }
      t.string :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
