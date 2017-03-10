class Answer < ApplicationRecord
  belongs_to :feedback, required: false
  belongs_to :question

  validates :response, presence: true, length: {maximum: 255}

  def <=>(other)
    self.question <=> other.question
  end

end
