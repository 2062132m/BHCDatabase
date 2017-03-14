class AddUniqueToInitiatives < ActiveRecord::Migration[5.0]
  def change
    add_index :initiatives, [:name, :location], unique: true
  end
end
