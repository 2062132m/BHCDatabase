class AddUniqueToUser < ActiveRecord::Migration[5.0]
  def change
    add_index :users, [:dob, :email, :telephone], unique: true
  end
end
