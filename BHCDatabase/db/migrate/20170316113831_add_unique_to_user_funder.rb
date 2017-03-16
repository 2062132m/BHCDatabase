class AddUniqueToUserFunder < ActiveRecord::Migration[5.0]
  def change
    add_index :user_funders, [:funder_id, :user_id], :unique => true
  end
end
