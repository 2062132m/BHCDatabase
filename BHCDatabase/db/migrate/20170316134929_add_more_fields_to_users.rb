class AddMoreFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :surname, :string
    add_column :users, :known_as, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :town, :string
    add_column :users, :postcode, :string
    add_column :users, :emergency_name, :string
    rename_column :users, :emergency_contact, :emergency_telephone
  end
end
