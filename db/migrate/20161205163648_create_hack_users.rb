class CreateHackUsers < ActiveRecord::Migration
  def self.up
    create_table :hack_users do |t|
      t.integer :hack_id, :null => false
      t.integer :user_id, :null => false

      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :hack_users, :hack_id
    add_index :hack_users, :user_id
  end

  def self.down
    drop_table :hack_users
  end
end
