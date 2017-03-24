# Enrolment is our method of linking a user to a given initiative.
#   Through this model, a user can easily find all initiatives they attend
#   through user.initiatives and vice versa for an initiative to find all the
#   users that are enrolled for it.
class Enrolment < ApplicationRecord
  belongs_to :user
  belongs_to :initiative

  validates_uniqueness_of :user_id, scope: :initiative_id
end
