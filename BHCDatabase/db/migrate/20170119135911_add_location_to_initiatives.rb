class AddLocationToInitiatives < ActiveRecord::Migration[5.0]
  def change
    add_column :initiatives, :location, :string
  end
end
