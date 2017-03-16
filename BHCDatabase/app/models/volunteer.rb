class Volunteer < ApplicationRecord
  validates :life_experiences, presence: true
  validates :skills, presence: true
  validates :aspirations, presence: true
  validates :num_children, presence: true
  validates :childcare_help, presence: true
  validates :carer, presence: true
  validates :carer_costs, presence: true
  validates :employment, presence: true
  validates :registered_disabled, presence: true
  validates :induction_completed, presence: true
end
