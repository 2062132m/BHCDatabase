class RemovedMedicalFunding < ApplicationRecord
  belongs_to :funder
  belongs_to :medical_condition
end
