class AddDateGivenToRemovedInitiativeFundings < ActiveRecord::Migration[5.0]
  def change
    add_column :removed_initiative_fundings, :date_given, :datetime
  end
end
