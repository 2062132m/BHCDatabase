class FeedbacksController < ApplicationController

  skip_before_action :admin_only

  def show
    @feedback = Feedback.find(params[:id])
  end

  def new
    @feedback = Feedback.new
    @questions = Question.where(:visible => true)
    @questions.count.times {@feedback.answers.build}
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @questions = Question.where(:visible => true)
    if @feedback.save
      flash[:success] = 'Created a new feedback!'
      redirect_to @feedback
    else
      puts @feedback.valid?
      render 'new'
    end
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:user_id, answers_attributes: [:id, :response, :question_id, :feedback_id])
  end
end
