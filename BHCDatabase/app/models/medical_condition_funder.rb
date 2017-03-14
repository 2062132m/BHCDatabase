class MedicalConditionFunder < ApplicationRecord
  belongs_to :funder
  belongs_to :medical_condition
end
