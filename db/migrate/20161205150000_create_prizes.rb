class CreatePrizes < ActiveRecord::Migration
  def self.up
    create_table :prizes do |t|
      t.integer :category_id, :null => false
      t.integer :amount, :null => false
      t.integer :rank, :null => false

      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :prizes, :category_id
  end

  def self.down
    drop_table :prizes
  end
end
