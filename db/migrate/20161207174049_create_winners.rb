class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.references :hackimoto, index: true
      t.references :prize, index: true
      t.references :hack, index: true

      t.timestamps null: false
    end
    add_foreign_key :winners, :hackimotos
    add_foreign_key :winners, :prizes
    add_foreign_key :winners, :hacks
  end
end
