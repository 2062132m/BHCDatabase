# MedicalConditionFunder is the intermediary class between a Funder
#   and a MedicalCondition
class MedicalConditionFunder < ApplicationRecord
  belongs_to :funder
  belongs_to :medical_condition

  validates_uniqueness_of :funder_id, scope: :medical_condition
end
