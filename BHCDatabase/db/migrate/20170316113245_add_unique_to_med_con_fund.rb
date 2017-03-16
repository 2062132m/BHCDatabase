class AddUniqueToMedConFund < ActiveRecord::Migration[5.0]
  def change
    add_index :medical_condition_funders, [:funder_id, :medical_condition_id], unique: true, :name => 'unique funder'
  end
end
