class AddArchivedToInitiatives < ActiveRecord::Migration[5.0]
  def change
    add_column :initiatives, :archived, :boolean, :default => false
  end
end
