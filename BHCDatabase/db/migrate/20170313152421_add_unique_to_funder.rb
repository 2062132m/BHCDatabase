class AddUniqueToFunder < ActiveRecord::Migration[5.0]
  def change
    add_index :funders, [:name, :email], unique: true
  end
end
