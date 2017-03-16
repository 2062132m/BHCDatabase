class RemoveUserIdIdFromVolunteers < ActiveRecord::Migration[5.0]
  def change
    remove_column :volunteers, :user_id_id, :integer
  end
end
