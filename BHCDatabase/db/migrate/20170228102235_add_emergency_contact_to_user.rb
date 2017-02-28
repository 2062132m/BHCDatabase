class AddEmergencyContactToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :emergency_contact, :string
  end
end
