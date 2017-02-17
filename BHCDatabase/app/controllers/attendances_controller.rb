class AttendancesController < ApplicationController
  def new
  end

  def create
    meeting_id = 0
    unless params[:attendance].nil?
      params[:attendance].each do |a|
        words = a.split(',')
        @attendance = Attendance.new(:user_id => words[0].scan( /\d+$/ ).first,
                                     :meeting_id => words[1][0...-1].scan( /\d+$/ ).first)
        unless @attendance.save
          flash[:danger] = "Something went wrong."
          redirect_to Meeting.find(meeting_id)
        end
        meeting_id = words[1][0...-1].scan( /\d+$/ ).first
      end
    flash[:success] = "Attendance saved!"
    redirect_to Meeting.find(meeting_id)
    end
    flash[:success] = "Please select at least one attendant"
    redirect_to(:back)
  end

  # private
  #
  #   def attendance_params
  #     params.permit(attendance:[])
  #   end
end
