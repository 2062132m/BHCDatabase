# RemovedMedicalFunding holds the history of given medical condition having been
#   funded in the past by a particular Funder.
class RemovedMedicalFunding < ApplicationRecord
  belongs_to :funder
  belongs_to :medical_condition
end
