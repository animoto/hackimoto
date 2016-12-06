class CreateJudges < ActiveRecord::Migration
  def self.up
    create_table :judges do |t|
      t.integer :hackimoto_id, :null => false
      t.integer :user_id, :null => false

      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :judges, :hackimoto_id
    add_index :judges, :user_id
  end

  def self.down
    drop_table :judges
  end
end
