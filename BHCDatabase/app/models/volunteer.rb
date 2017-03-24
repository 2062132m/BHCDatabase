# Volunteer is the generic model that holds the 'PDP' for a given volunteer.
class Volunteer < ApplicationRecord
  validates :life_experiences, presence: true, length: { maximum: 65_536 }
  validates :skills, presence: true, length: { maximum: 65_536 }
  validates :aspirations, presence: true, length: { maximum: 65_536 }
  validates :num_children, presence: true, numericality: { only_integer: true }
  validates :childcare_help, inclusion: { in: [true, false] }
  validates :carer, inclusion: { in: [true, false] }
  validates :carer_costs, inclusion: { in: [true, false] }
  validates :employment, presence: true, length: { maximum: 255 }
  validates :registered_disabled, inclusion: { in: [true, false] }
  validates :induction_completed, inclusion: { in: [true, false] }
end
