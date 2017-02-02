class MedicalCondition < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
end
