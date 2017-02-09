class Condition < ApplicationRecord
  belongs_to :medical_condition
  belongs_to :user
end
