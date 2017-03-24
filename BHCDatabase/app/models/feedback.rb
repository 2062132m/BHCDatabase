# Feedback allows us to link a user to a specific feedback they have left.
# This model is used by answers to discern who the answer came from and also
#   what feedback it belongs to.
class Feedback < ApplicationRecord
  belongs_to :user

  has_many :answers, dependent: :delete_all

  accepts_nested_attributes_for :answers
end
