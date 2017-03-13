class Feedback < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :delete_all

  accepts_nested_attributes_for :answers
end
