class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
    @users = @meeting.users
  end

  def new
    @meeting = Meeting.new
    @initiatives = Initiative.all
  end
end
