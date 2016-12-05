class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string  :name, :null => false
      t.string  :description
      t.date    :start_date, :null => false
      t.integer :hackimoto_id, :null => false

      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :categories, :hackimoto_id
  end

  def self.down
    drop_table :categories
  end
end
