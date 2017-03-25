# InitiativeFunder is our intermediary model between an Initiative and its
#   Funder
class InitiativeFunder < ApplicationRecord
  belongs_to :funder
  belongs_to :initiative

  validates_uniqueness_of :funder_id, scope: :initiative
end
