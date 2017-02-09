class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.references :medical_condition, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
