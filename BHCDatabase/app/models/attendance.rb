class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  validates_uniqueness_of :user_id, :scope => :meeting_id
end
