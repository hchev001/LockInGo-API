class CreateSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :sessions do |t|
      t.integer :occurrence_id
      t.datetime :started_at
      t.datetime :ended_at
      t.float :duration_sec
      t.string :source

      t.timestamps
    end
  end
end
