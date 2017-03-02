class MedicalCondition < ApplicationRecord

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 255}
  validates :archived, presence: true
  validates :reason_archived, length: {maximum: 30}

  has_many :conditions
  has_many :users, through: :conditions

end
