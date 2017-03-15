class AddDateGivenToRemovedUserFundings < ActiveRecord::Migration[5.0]
  def change
    add_column :removed_user_fundings, :date_given, :datetime
  end
end
