# Question is the generic model for a given Question
# Defines the questions that will be asked in the feedback.
class Question < ApplicationRecord
  validates :question,
            presence: true,
            length: { maximum: 65_536 },
            uniqueness: { case_sensitive: false }
  validates :visible, inclusion: { in: [true, false] }
  validates :question_type, presence: true
end
