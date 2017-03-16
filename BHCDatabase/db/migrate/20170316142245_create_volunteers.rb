class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.text :life_experiences
      t.text :skills
      t.text :aspirations
      t.integer :num_children
      t.boolean :childcare_help
      t.boolean :carer
      t.boolean :carer_costs
      t.string :employment
      t.boolean :registered_disabled
      t.boolean :induction_completed

      t.timestamps
    end
  end
end
