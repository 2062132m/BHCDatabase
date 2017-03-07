class AddArchivedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :archived, :boolean, :default => false
  end
end
