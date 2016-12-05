class CreateHacks < ActiveRecord::Migration
  def self.up
    create_table :hacks do |t|
      t.string  :name, :null => false
      t.string  :description
      t.integer :hackimoto_id, :null => false
      t.integer :proposed_user_id, :null => false
      t.boolean :is_hack, :default => false

      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :hacks, :hackimoto_id
  end

  def self.down
    drop_table :hacks
  end
end
