class CreateMedicalConditionFunders < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_condition_funders do |t|
      t.references :funder, foreign_key: true
      t.references :medical_condition, foreign_key: true

      t.timestamps
    end
  end
end
