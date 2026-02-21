class CreateTaskRecurrences < ActiveRecord::Migration[8.1]
  def change
    create_table :task_recurrences do |t|
      t.string :cron_expr, null:false
      t.datetime :window_start, null:false
      t.datetime :window_end, null:false
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
