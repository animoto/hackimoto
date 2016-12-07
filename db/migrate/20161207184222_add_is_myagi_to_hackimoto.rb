class AddIsMyagiToHackimoto < ActiveRecord::Migration
  def change
    add_column :hackimotos, :is_myagi?, :boolean
  end
end
