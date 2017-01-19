class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :telephone, :string
    add_column :users, :dob, :date
    add_column :users, :privilege, :integer
  end
end
