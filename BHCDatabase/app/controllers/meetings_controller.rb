class MeetingsController < ApplicationController

  before_action :admin?

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
  end
end
