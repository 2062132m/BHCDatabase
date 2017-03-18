class FeedbacksController < ApplicationController

  skip_before_action :admin_only
  # Ensures that only the owner of a feedback is allowed to view it
  before_action :correct_users_feedback?, only: [:show]

  def show
    @feedback = Feedback.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @feedback = Feedback.new
    @questions = Question.where(visible: true).where('id < ?', 23).order(:id)
    # Builds our @feedback.answers, linking all answers to all available questions
    @questions.each { |question| @feedback.answers.build(:question_id => question.id) }
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @user = User.find(@feedback.user)
    @questions = Question.where(:visible => true)
    if @feedback.save
      flash[:success] = 'Created a new feedback!'
      unless @user.update_attribute(:feedback_due, @user.feedback_due >> 6)
        flash[:warning] = "Next feedback due date wasn't set, please contact someone."
      end
      redirect_to @feedback
    else
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

  def allowed_to_leave_feedback
    unless current_user.feedback_due <= Date.today
      flash[:warning] = "You aren't due to leave feedback yet."
      redirect_to serviceusershome_path
    end
  end

  def correct_users_feedback?
    @feedback = Feedback.find(params[:id])
    unless current_user.admin?
      if @feedback.user != current_user || current_user.volunteer?
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to @current_user
      end
    end
  end
end
