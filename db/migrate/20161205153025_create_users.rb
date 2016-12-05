class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, :null => false
      t.string :oauth_token

      t.datetime :oauth_expires_at
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :users, :email
    add_index :users, :oauth_token
  end

  def self.down
    drop_table :users
  end
end
