require 'test_helper'

class AttendancesRetakeTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @volunteer = users(:volunteer)
    @service_user = users(:service_user)
    @meeting = meetings(:two)
    log_in_as(@admin)
  end

  # Ensure attendances are deleted and attendance percentage is reset to 0
  #   upon 'retaking' the attendance
  test 'retake attendance test' do
    # Start by creating an attendance
    get meeting_path(@meeting)
    assert_difference 'Attendance.count', 2 do
      # Assume volunteer and service_user are attending
      post attendances_path, params: { meeting_id: @meeting.id,
                                       attendance: [@volunteer.id, @service_user.id] }
    end
    # Arbitrary value to avoid expected nil attendance error
    @meeting.update_attributes(attendance: 50)
    follow_redirect!
    assert_template 'meetings/show'
    # Assert attendances are deleted upon deleting the meeting
    assert_difference 'Attendance.count', -2 do
      delete meeting_url(@meeting)
    end
    @meeting.reload
    # Assert the attendance has been reset to 0
    assert_equal 0, @meeting.attendance
  end
end
