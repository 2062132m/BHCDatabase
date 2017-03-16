class MeetingsController < ApplicationController
  skip_before_action :admin_only, only: [:show, :new, :create, :destroy]

  # Only allows volunteers that belong to the correct meeting to view #show
  before_action :correct_meeting_only, only: [:show]
  before_action :correct_initiative_only_on_creation, only: [:new]

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
    @initiative = Meeting.find(params[:id]).initiative
    @users = @meeting.users.where(:archived => false)
    @attendance = Attendance.new
  end

  def new
    @meeting = Meeting.new
    @initiatives = Initiative.all
    @meetings = Initiative.find(params[:initiative_id]).meetings
    if @meetings.count == 0
      @last_meeting_time = DateTime.now
    else
      @last_meeting_time = Initiative.find(params[:initiative_id]).meetings.last.datetime
      @last_meeting_time += 1.week
    end
  end

  def create
    params[:weeks].to_i.times do |i|
      @meeting = Meeting.new(meeting_params)
      @first_meeting = @meeting if i == 0
      @meeting.update_attribute(:datetime, @meeting.datetime + i.weeks)
      unless @meeting.save
        flash[:danger] = 'Something went wrong'
        render 'new'
        return
      end
    end
    flash[:success] = 'Created the new session!'
    redirect_to @first_meeting
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

  # Ensure that a user enrolled for the initiative belonging to the meeting can access the meeting(s) page
  def correct_meeting_only
    redirect_to @current_user if service_user?
    if volunteer?
      @current_user.initiatives.each do |init|
        return if init.meetings.include?(Meeting.find(params[:id]))
      end
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to current_user
    end
  end

  def meeting_params
    params.require(:meeting).permit(:datetime, :initiative_id)
  end
end
