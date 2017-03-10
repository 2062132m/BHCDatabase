class AttendancesController < ApplicationController

  skip_before_action :admin_only

  def create
    meeting_id = 0
    @numAttendees = 0
    # If attendance form was completed
    unless params[:attendance].nil?
      params[:attendance].each do |a|
        # Split each entry at the ','
        # Words is a 2 item array with [user_id, meeting_id]
        words = a.split(',')
        # Scan the items to get the target information
        @attendance = Attendance.new(:user_id => words[0].scan(/\d+$/).first,
                                     :meeting_id => words[1][0...-1].scan(/\d+$/).first)
        unless @attendance.save
          flash[:danger] = "Something went wrong."
          redirect_to Meeting.find(meeting_id)
          return
        end
        # Total the number of attendants
        @numAttendees += 1
        # Get the meeting_id, which is always the same
        meeting_id = words[1][0...-1].scan(/\d+$/).first
      end
      meeting = Meeting.find(meeting_id)
      @initiative = meeting.initiative
      # Get the total number of people in the initiative
      @totalAttendees = Enrolment.where(:initiative_id => @initiative, :user_id => (User.where(:privilege => 2).ids)).count
      # Convert totalAttendees to a float to force floating point division
      #   in order to calculate the attendance percentage
      meeting.update_attribute(:attendance, @numAttendees/@totalAttendees.to_f * 100)
      meeting.save
      flash[:success] = "Attendance saved!"
      redirect_to Meeting.find(meeting_id)
      return
    end
    flash[:danger] = "Please select at least one attendant"
    redirect_to(:back)
  end
end