# UnassignedCondition holds the history of a given user having a medical
#   history.
class UnassignedCondition < ApplicationRecord
  belongs_to :medical_condition
  belongs_to :user
end
