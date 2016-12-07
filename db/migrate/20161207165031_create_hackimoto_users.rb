class CreateHackimotoUsers < ActiveRecord::Migration
  def change
    create_table :hackimoto_users do |t|
      t.references :user, index: true
      t.references :hackimoto, index: true

      t.timestamps null: false
    end
    add_foreign_key :hackimoto_users, :users
    add_foreign_key :hackimoto_users, :hackimotos
  end
end
