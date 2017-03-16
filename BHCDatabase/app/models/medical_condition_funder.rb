class MedicalConditionFunder < ApplicationRecord
  belongs_to :funder
  belongs_to :medical_condition

  validates_uniqueness_of :funder, :scope => :medical_condition
end
