# Answer is the class which holds the response to a question, and the foreign
#   keys required to link the answer to a feedback and the question
#   it corresponds to.
class Answer < ApplicationRecord
  belongs_to :feedback, required: false
  belongs_to :question

  validates :response, presence: true, length: { maximum: 65_536 }
  validates_uniqueness_of :feedback_id, scope: :question_id

  # Comparison function to allow logical .sort on Answer collections
  def <=>(other)
    question <=> other.question
  end
end
