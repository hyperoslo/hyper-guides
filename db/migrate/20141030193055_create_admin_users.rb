class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email,      null: false

      t.timestamps          null: false
    end

    add_index :admin_users, :email, unique: true
  end
end
