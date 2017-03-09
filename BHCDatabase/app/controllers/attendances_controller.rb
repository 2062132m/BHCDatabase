class AttendancesController < ApplicationController

  skip_before_action :admin_only

  def create
    meeting_id = 0
    @num_attendees = 0
    unless params[:attendance].nil?
      params[:attendance].each do |a|
        words = a.split(',')
        @attendance = Attendance.new(:user_id => words[0].scan(/\d+$/).first,
                                     :meeting_id => words[1][0...-1].scan(/\d+$/).first)
        unless @attendance.save
          flash[:danger] = "Something went wrong."
          redirect_to Meeting.find(meeting_id)
          return
        end
        @num_attendees += 1
        meeting_id = words[1][0...-1].scan(/\d+$/).first
      end
      meeting = Meeting.find(meeting_id)
      @initiative = meeting.initiative
      @total_attendees = Enrolment.where(:initiative_id => @initiative, :user_id => (User.where(:privilege => 2).ids)).count
      meeting.update_attribute(:attendance, @num_attendees/@total_attendees.to_f * 100)
      meeting.save
      flash[:success] = "Attendance saved!"
      redirect_to Meeting.find(meeting_id)
      return
    end
    flash[:danger] = "Please select at least one attendant"
    redirect_to(:back)
  end
end
