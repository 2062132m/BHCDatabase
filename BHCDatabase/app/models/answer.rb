class Answer < ApplicationRecord
  belongs_to :feedback, required: false
  belongs_to :question

  validates :response, presence: true, length: {maximum: 65536}
  validates_uniqueness_of :feedback_id, :scope => :question_id

  def <=>(other)
    self.question <=> other.question
  end
end
