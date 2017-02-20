class FeedbacksController < ApplicationController

  skip_before_action :admin_only
  before_action :service_user_only, only: [:new, :create]
  before_action :allowed?


  def show
    @feedback = Feedback.find(params[:id])
  end

  def new
    @feedback = Feedback.new
    @questions = Question.where(:visible => true)
    @questions.each do |question|
      @feedback.answers.build(:question_id => question.id)
    end
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

  def allowed?
    @feedback = Feedback.find(params[:id])
    unless @current_user.privilege == 0
      if @feedback.user != @current_user
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to @current_user
      end
    end
  end
end
