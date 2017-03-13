class CreateUnassignedConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :unassigned_conditions do |t|
      t.references :medical_condition, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :date_unassigned

      t.timestamps
    end
  end
end
