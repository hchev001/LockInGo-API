class CreateAuditLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_logs do |t|
      t.string :action, null: false
      t.string :actor, null: false
      t.string :entity, null: false
      t.integer :entity_id, null: false
      t.json :before, null: false
      t.json :after, null: false

      t.timestamps
    end
  end
end
