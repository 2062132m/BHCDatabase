require 'test_helper'

class AttendancesNewTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @volunteer = users(:volunteer)
    @service_user = users(:service_user)
    @meeting = meetings(:one)
    log_in_as(@admin)
  end

  test "valid new attendance test" do
    get meeting_path(@meeting)
    assert_difference 'Attendance.count', 2 do
      # Assume volunteer and service_user are attending
      post attendances_path, params: { meeting_id: @meeting.id, attendance: [@volunteer.id, @service_user.id] }
    end
    # Arbitrary value to avoid expected nil attendance error
    @meeting.update_attributes(attendance: 50)
    follow_redirect!
    assert_template 'meetings/show'
  end

  test "empty new attendance test" do
    get meeting_path(@meeting)
    assert_difference 'Attendance.count', 0 do
      # Empty array to simulate empty attendance form
      post attendances_path, params: { meeting_id: @meeting.id, attendance: [] }
    end
    # Ensure the attendance has not changed
    assert_equal 0, @meeting.attendance
    follow_redirect!
    assert_not flash.empty?
    assert_template 'meetings/show'
  end

  test "invalid new attendance test" do
    get meeting_path(@meeting)
    assert_difference 'Attendance.count', 0 do
      # Invalid user_id to force error
      post attendances_path, params: { meeting_id: @meeting.id, attendance: [-1] }
    end
    # Ensure the attendance has not changed
    assert_equal 0, @meeting.attendance
    follow_redirect!
    assert_not flash.empty?
    assert_template 'meetings/show'
  end
end
