class AddHackimotoIdToHackUsers < ActiveRecord::Migration
  def self.up
    change_column :hack_users, :hack_id, :integer, :null => true
    add_column :hack_users, :hackimoto_id, :integer
  end

  def self.down
    change_column :hack_users, :hack_id, :integer, :null => false
    remove_column :hack_users, :hackimoto_id
  end
end
