class ChangeLocationTypeInInitiatives < ActiveRecord::Migration[5.0]
  def change
    change_column :initiatives, :location, :text
  end
end
