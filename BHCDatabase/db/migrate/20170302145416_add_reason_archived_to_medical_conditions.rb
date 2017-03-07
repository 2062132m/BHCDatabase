class AddReasonArchivedToMedicalConditions < ActiveRecord::Migration[5.0]
  def change
    add_column :medical_conditions, :reason_archived, :string
  end
end
