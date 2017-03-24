# RemovedUserFunding holds the history of given user having been funded in the
#   past by a particular Funder.
class RemovedUserFunding < ApplicationRecord
  belongs_to :funder
  belongs_to :user
end
