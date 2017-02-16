class FeedbacksController < ApplicationController
  def show
    @feedback = Feedback.find(params[:id])
  end
end
