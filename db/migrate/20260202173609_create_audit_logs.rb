class CreateAuditLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_logs do |t|
      t.string :ts
      t.string :actor
      t.string :action
      t.string :entity
      t.integer :entity_id
      t.json :before
      t.json :after

      t.timestamps
    end
  end
end
