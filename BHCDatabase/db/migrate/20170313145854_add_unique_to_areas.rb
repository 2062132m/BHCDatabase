class AddUniqueToAreas < ActiveRecord::Migration[5.0]
  def change
    add_index :areas, :name, unique: true
  end
end
