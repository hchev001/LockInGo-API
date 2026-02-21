class CreateOccurrences < ActiveRecord::Migration[8.1]
  def change
    create_table :occurrences do |t|
      t.string :status
      t.datetime :scheduled_for
      t.string :notes
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
