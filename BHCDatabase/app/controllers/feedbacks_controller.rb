class FeedbacksController < ApplicationController

  skip_before_action :admin_only
  before_action :service_user_only, :allowed_to_leave_feedback, only: [:new, :create]
  before_action :correct_users_feedback?, only: [:show]


  def show
    @feedback = Feedback.find(params[:id])
  end

  def new
    @user = @current_user
    @feedback = Feedback.new
    @questions = Question.where(:visible => true)
    @questions.each do |question|
      @feedback.answers.build(:question_id => question.id)
    end
  end

  def create
    @user = @current_user
    @feedback = Feedback.new(feedback_params)
    @questions = Question.where(:visible => true)

    if @feedback.save
      flash[:success] = 'Created a new feedback!'

      unless @user.update_attribute(:feedback_due, @user.feedback_due >> 6)
        flash[:warning] = 'An error occurred.'
      end

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

  def allowed_to_leave_feedback
    @user = @current_user
    unless @user.feedback_due <= Date.today
      flash[:warning] = "You aren't due to leave feedback yet."
      redirect_to serviceusershome_path
    end
  end

  def correct_users_feedback?
    @feedback = Feedback.find(params[:id])
    unless @current_user.privilege == 0
      if @feedback.user != @current_user
        flash[:danger] = 'You are not allowed to access that page.'
        redirect_to @current_user
      end
    end
  end
end
