class RenameNameToForename < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :name, :forename
  end
end
