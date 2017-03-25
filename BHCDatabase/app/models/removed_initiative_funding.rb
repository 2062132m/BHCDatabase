# RemovedInitiativeFunding holds the history of given initiative having been
#   funded in the past by a particular Funder.
class RemovedInitiativeFunding < ApplicationRecord
  belongs_to :funder
  belongs_to :initiative
end
