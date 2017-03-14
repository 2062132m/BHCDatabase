class MedicalCondition < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 255}
  validates :reason_archived, length: {maximum: 30}

  has_many :conditions, dependent: :delete_all
  has_many :unassigned_conditions, dependent: :delete_all
  has_many :users, through: :conditions
  has_many :medical_conditions_funders, dependent: :delete_all

end
