class AddUniqueToMedCon < ActiveRecord::Migration[5.0]
  def change
    add_index :medical_conditions, :name, unique: true
  end
end
