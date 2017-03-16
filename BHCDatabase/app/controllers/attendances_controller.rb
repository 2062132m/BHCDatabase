class AttendancesController < ApplicationController

  skip_before_action :admin_only

  def create
    # Get the id of the meeting
    meeting_id = params[:meeting_id]
    # The number of users who attended this particular meeting
    numAttendees = 0
    # If at least one name was checked
    unless params[:attendance].nil?
      params[:attendance].each do |user_id|
        # Create a new attendance object
        @attendance = Attendance.new(:user_id => user_id, :meeting_id => meeting_id)
        unless @attendance.save
          flash[:danger] = "Something went wrong."
          redirect_to Meeting.find(meeting_id)
          return
        end
        # Total the number of attendants
        numAttendees += 1
      end
      @meeting = Meeting.find(meeting_id)
      @initiative = @meeting.initiative
      # Get the total number of people in the initiative
      totalEnrolled = Enrolment.where(:initiative_id => @initiative, :user_id => (User.where(:privilege => 2, :archived => false).ids)).count
      # Convert totalAttendees to a float to force floating point division
      #   in order to calculate the attendance percentage
      @meeting.update_attribute(:attendance, numAttendees/totalEnrolled.to_f * 100)
      @meeting.save
      flash[:success] = "Attendance saved!"
      redirect_to Meeting.find(meeting_id)
      return
    end
    flash[:danger] = "Please select at least one attendant"
    redirect_to(:back)
  end
end
