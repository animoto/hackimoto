class CreateHackimotos < ActiveRecord::Migration
  def self.up
    create_table :hackimotos do |t|
      t.string :name, :null => false
      t.string :description
      t.date   :start_date, :null => false

      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :hackimotos
  end
end
