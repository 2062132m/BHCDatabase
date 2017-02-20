class Answer < ApplicationRecord
  belongs_to :feedback, required: false

  belongs_to :question
end
