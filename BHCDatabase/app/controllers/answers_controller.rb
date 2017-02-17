class AnswersController < ApplicationController

  skip_before_action :admin_only

  def new
    @feed = []
    @feedbacks = Feedback.where(:user_id => @current_user.id)
    @questions = Question.where(:visible => true)
    @questions.count.times do
      @feed << Answer.new
    end
  end

  def create
    params['answers'].each do |answer|
      Answer.create(answer_params(answer))
    end
  end

  private

  def answer_params(my_params)
    my_params.permit(:feedback_id, :question_id, :response)
  end
end
