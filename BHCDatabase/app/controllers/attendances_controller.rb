class AttendancesController < ApplicationController
  skip_before_action :admin_only

  def create
    # The number of users who attended this particular meeting
    num_attendees = 0
    # If at least one name was checked
    if params[:attendance].nil?
      flash[:danger] = 'Please select at least one attendant'
      redirect_to :back
    else
      params[:attendance].each do |user_id|
        # Create a new attendance object
        @attendance = Attendance.new(:user_id => user_id, :meeting_id => params[:meeting_id])
        unless @attendance.save
          flash[:danger] = 'Something went wrong.'
          redirect_to Meeting.find(params[:meeting_id])
          return
        end
        # Total the number of attendants
        num_attendees += 1
      end
      @meeting = Meeting.find(params[:meeting_id])
      @initiative = @meeting.initiative
      # Get the total number of people in the initiative
      total_enrolled = Enrolment.where(:initiative_id => @initiative, :user_id => (User.where(:privilege => 2, :archived => false).ids)).count
      # Convert totalAttendees to a float to force floating point division
      #   in order to calculate the attendance percentage
      if @meeting.update_attributes(:attendance => num_attendees/total_enrolled.to_f * 100)
        flash[:success] = 'Attendance saved!'
      else
        flash[:danger] = "Something went wrong and attendance wasn't calculated."
      end
      redirect_to Meeting.find(params[:meeting_id])
    end
  end
end
