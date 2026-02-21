class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: "User's full name for display purposes"
      t.string :email, null: false, index: { unique: true }, comment: "User's email address, used for login and communication"
      t.string :password, null: false


      t.timestamps
    end
  end
end
