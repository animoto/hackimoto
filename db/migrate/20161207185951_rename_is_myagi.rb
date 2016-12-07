class RenameIsMyagi < ActiveRecord::Migration
  def change
    rename_column :hackimotos, :is_myagi?, :is_myagi
  end
end
