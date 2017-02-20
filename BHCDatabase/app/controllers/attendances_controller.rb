class AttendancesController < ApplicationController

  skip_before_action :admin_only

  def create
    meeting_id = 0
    @numAttendees = 0
    unless params[:attendance].nil?
      params[:attendance].each do |a|
        words = a.split(',')
        @attendance = Attendance.new(:user_id => words[0].scan( /\d+$/ ).first,
                                     :meeting_id => words[1][0...-1].scan( /\d+$/ ).first)
        unless @attendance.save
          flash[:danger] = "Something went wrong."
          redirect_to Meeting.find(meeting_id)
          return
        end
        @numAttendees += 1
        meeting_id = words[1][0...-1].scan( /\d+$/ ).first
      end
    meeting = Meeting.find(meeting_id)
    @initiative = meeting.initiative
    @totalAttendees = Enrolment.where(:initiative_id => @initiative).count
    meeting.update_attribute(:attendance, @numAttendees/@totalAttendees.to_f * 100)
    meeting.save
    flash[:success] = "Attendance saved!"
    redirect_to Meeting.find(meeting_id)
    return
    end
    flash[:danger] = "Please select at least one attendant"
    redirect_to(:back)
  end

  # private
  #
  #   def attendance_params
  #     params.permit(attendance:[])
  #   end
end
