class FeedbacksController < ApplicationController

  skip_before_action :admin_only

  def show
    @feedback = Feedback.find(params[:id])
  end

  def new
    @feedback = Feedback.new
    @users = User.all
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @users = User.all
    if @feedback.save
      flash[:success] = 'Created a new feedback!'
      redirect_to @feedback
    else
      render 'new'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:user_id)
  end
end
