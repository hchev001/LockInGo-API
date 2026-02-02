class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.datetime :due_at
      t.boolean :is_active
      t.string :color
      t.string :icon

      t.timestamps
    end
  end
end
