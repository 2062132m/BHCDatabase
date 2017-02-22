class MedicalCondition < ApplicationRecord

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 255}

  has_many :conditions
  has_many :users, through: :conditions

end
