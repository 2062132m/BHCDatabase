class AddAttendanceToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :attendance, :integer
  end
end
