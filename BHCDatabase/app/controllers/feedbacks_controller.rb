class FeedbacksController < ApplicationController
  skip_before_action :admin_only

  # Ensures that only the owner of a feedback is allowed to view it
  before_action :correct_show_feedback, only: [:show]
  before_action :correct_new_feedback, only: [:new]
  before_action :correct_create_feedback, only: [:create]

  def show
    @feedback = Feedback.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @feedback = Feedback.new
    @questions = Question.where(visible: true).where('id < ?', 23).order(:id)
    # Builds our @feedback.answers, linking all answers to all available questions
    @questions.each { |question| @feedback.answers.build(question_id: question.id) }
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @user = User.find(@feedback.user.id)
    @questions = Question.where(visible: true)
    if @feedback.save
      flash[:success] = 'Created a new feedback!'
      unless @user.update(feedback_due: Time.zone.now + 6.months)
        flash[:warning] = 'An unknown error occurred and the next feedback due date was not set. Please contact support.'
      end
      redirect_to @feedback
    else
      render 'new'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:user_id, answers_attributes: [:id, :response, :question_id, :feedback_id])
  end

  def correct_new_feedback
    return if current_user.admin?
    if User.find(params[:user_id]) != current_user
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def correct_create_feedback
    return if current_user.admin?
    if User.find(params[:feedback][:user_id]) != current_user
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def correct_show_feedback
    @feedback = Feedback.find(params[:id])
    unless current_user.admin?
      if @feedback.user != current_user
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to current_user
      end
    end
  end
end
