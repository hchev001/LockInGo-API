class CreateOccurrences < ActiveRecord::Migration[8.1]
  def change
    create_table :occurrences do |t|
      t.integer :task_id
      t.string :scheduled_for
      t.string :status
      t.string :notes

      t.timestamps
    end
  end
end
