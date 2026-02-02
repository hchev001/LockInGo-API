class CreateTaskRecurrences < ActiveRecord::Migration[8.1]
  def change
    create_table :task_recurrences do |t|
      t.integer :task_id
      t.string :type
      t.string :cron_expr
      t.datetime :window_start
      t.datetime :window_end

      t.timestamps
    end
  end
end
