class Answer < ApplicationRecord
  belongs_to :feedback, required: false

  belongs_to :question

  validates :response, presence: true, length: {maximum: 255}
end
