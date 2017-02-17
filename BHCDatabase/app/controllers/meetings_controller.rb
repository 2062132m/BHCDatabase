class MeetingsController < ApplicationController

  skip_before_action :admin_only, only: [:show, :new, :create]
  before_action :correct_meeting_only, only: [:show]
  before_action :correct_initiative_only_on_creation, only: [:new]

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
    @initiative = Meeting.find(params[:id]).initiative
    @users = @meeting.users
  end

  def new
    @meeting = Meeting.new
    @initiatives = Initiative.all
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      flash[:success] = 'Created the new session!'
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
