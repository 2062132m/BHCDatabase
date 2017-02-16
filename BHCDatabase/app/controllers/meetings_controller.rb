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

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      flash[:success] = 'Created the new meeting!'
      redirect_to @meeting
    else
      render 'new'
    end
  end

  private

    def meeting_params
      params.require(:meeting).permit(:datetime, :initiative_id)
    end
end
