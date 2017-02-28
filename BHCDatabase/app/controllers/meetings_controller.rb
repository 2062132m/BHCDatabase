class MeetingsController < ApplicationController

  skip_before_action :admin_only, only: [:show, :new, :create, :destroy]
  before_action :correct_meeting_only, only: [:show]
  before_action :correct_initiative_only_on_creation, only: [:new]

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
    @initiative = Meeting.find(params[:id]).initiative
    @users = @meeting.users
    @attendance = Attendance.new
  end

  def new
    @meeting = Meeting.new
    @initiatives = Initiative.all
    @meetings = Initiative.find(params[:initiative_id]).meetings
    unless @meetings.count == 0
      @lastmeetingtime = Initiative.find(params[:initiative_id]).meetings.last.datetime
      @lastmeetingtime += 1.week
    else
      @lastmeetingtime = DateTime.now
    end
  end

  def create
    @i = 0
    @weeks = params[:weeks].to_i
    while @i < @weeks do
      @meeting = Meeting.new(meeting_params)
      if @i == 0
        @firstMeeting = @meeting
      end
      @meeting.update_attribute(:datetime, @meeting.datetime + @i.weeks)
      unless @meeting.save
        flash[:danger] = 'Something went wrong'
        render 'new'
        return
      end
      @i += 1
    end
    flash[:success] = 'Created the new session!'
    redirect_to @firstMeeting
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    puts @meeting.attendances.ids
    @meeting.attendances.each do |attendance|
      attendance.destroy
    end
    @meeting.update_attribute(:attendance, 0)
    flash[:success] = "Attendance cleared"
    redirect_to meeting_url
  end

  private

    def meeting_params
      params.require(:meeting).permit(:datetime, :initiative_id)
    end
end
