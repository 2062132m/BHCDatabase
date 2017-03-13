class AddUniqueToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_index :attendances, [:user_id, :meeting_id], unique: true
  end
end
