# Unenrolment holds the history of a given user at one point in time, being
#   enrolled for an initiative.
class Unenrolment < ApplicationRecord
  belongs_to :user
  belongs_to :initiative
end
