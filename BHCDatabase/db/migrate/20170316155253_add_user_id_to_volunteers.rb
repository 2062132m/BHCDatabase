class AddUserIdToVolunteers < ActiveRecord::Migration[5.0]
  def change
    add_reference :volunteers, :user, foreign_key: true
  end
end
