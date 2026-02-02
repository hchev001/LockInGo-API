class CreateTaskFilters < ActiveRecord::Migration[8.1]
  def change
    create_table :task_filters do |t|
      t.integer :task_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
