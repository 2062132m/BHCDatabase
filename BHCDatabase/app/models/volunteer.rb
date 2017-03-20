class Volunteer < ApplicationRecord
  validates :life_experiences, presence: true, length: {maximum: 65536}
  validates :skills, presence: true, length: {maximum: 65536}
  validates :aspirations, presence: true, length: {maximum: 65536}
  validates :num_children, presence: true, numericality: {only_integer: true}
  validates :childcare_help, presence: true, inclusion: {in: [true, false]}
  validates :carer, presence: true, inclusion: {in: [true, false]}
  validates :carer_costs, presence: true, inclusion: {in: [true, false]}
  validates :employment, presence: true, length: {maximum: 255}
  validates :registered_disabled, presence: true, inclusion: {in: [true, false]}
  validates :induction_completed, presence: true, inclusion: {in: [true, false]}
end
