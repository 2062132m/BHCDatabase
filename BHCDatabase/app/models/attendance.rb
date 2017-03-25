# Attendance is our method of tracking a user attending a particular meeting.
#   A simple .exists? can discern attendance.
class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  validates_uniqueness_of :user_id, scope: :meeting_id
end
