# Condition is the intermediary model between a Medical Condition and User.
# Similar to Attendance, it permits easy querying to discern if a user has
#   a particular medical condition.
class Condition < ApplicationRecord
  belongs_to :medical_condition
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :medical_condition_id
end
