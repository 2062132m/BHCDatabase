class Question < ApplicationRecord

  validates :question, presence: true, length: {maximum: 255}
  validates :visible, presence: true, inclusion: {in: [true, false]}
  validates :sort, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :multiple_choice, presence: true, inclusion: {in: [true, false]}
end
