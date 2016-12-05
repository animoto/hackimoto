class CreateHackimotoAdminUsers < ActiveRecord::Migration
  def self.up
    create_table :hackimoto_admin_users do |t|
      t.integer :hackimoto_id, :null => false
      t.integer :user_id, :null => false

      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :hackimoto_admin_users, :hackimoto_id
    add_index :hackimoto_admin_users, :user_id
  end

  def self.down
    drop_table :users
  end
end
