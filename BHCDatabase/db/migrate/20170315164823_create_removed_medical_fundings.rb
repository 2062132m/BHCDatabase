class CreateRemovedMedicalFundings < ActiveRecord::Migration[5.0]
  def change
    create_table :removed_medical_fundings do |t|
      t.references :funder, foreign_key: true
      t.references :medical_condition, foreign_key: true

      t.timestamps
    end
  end
end
