class AddAreaIdToInitiatives < ActiveRecord::Migration[5.0]
  def change
    add_column :initiatives, :area_id, :integer
  end
end
