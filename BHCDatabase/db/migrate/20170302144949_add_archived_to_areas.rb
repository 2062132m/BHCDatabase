class AddArchivedToAreas < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :archived, :boolean, :default => false
  end
end
