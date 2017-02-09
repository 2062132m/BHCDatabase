class MedicalCondition < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true

  has_many :conditions
  has_many :users, through: :conditions

end
