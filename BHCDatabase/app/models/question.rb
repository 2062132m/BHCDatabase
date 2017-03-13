class Question < ApplicationRecord
  validates :question, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}
  validates :visible, inclusion: {in: [true, false]}
  validates :multiple_choice, inclusion: {in: [true, false]}
end
