class Condition < ApplicationRecord
  belongs_to :medical_condition
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :medical_condition_id
end
