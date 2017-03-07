class AddArchivedToMedicalConditions < ActiveRecord::Migration[5.0]
  def change
    add_column :medical_conditions, :archived, :boolean, :default => false
  end
end
