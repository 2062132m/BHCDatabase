class AddDateGivenToRemovedMedicalFundings < ActiveRecord::Migration[5.0]
  def change
    add_column :removed_medical_fundings, :date_given, :datetime
  end
end
