class AddUniqueToInitFund < ActiveRecord::Migration[5.0]
  def change
    add_index :initiative_funders, [:funder_id, :initiative_id], unique: true
  end
end
