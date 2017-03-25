require 'test_helper'

class AttendancesNewTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @volunteer = users(:volunteer)
    @service_user = users(:service_user)
    @meeting = meetings(:one)
    log_in_as(@admin)
  end

  # Ensure attendance creation should be successful with valid parameters
  test "valid new attendance test" do
    get meeting_path(@meeting)
    # Two attendants, so 2 attendance records should be created
    assert_difference 'Attendance.count', 2 do
      # Assume volunteer and service_user are attending
      post attendances_path, params: { meeting_id: @meeting.id, attendance: [@volunteer.id, @service_user.id] }
    end
    # Arbitrary value to avoid expected nil attendance error
    @meeting.update_attributes(attendance: 50)
    follow_redirect!
    assert_template 'meetings/show'
  end

  # Ensure attendance is not taken when form is left empty
  test "empty new attendance test" do
    get meeting_path(@meeting)
    # No attendants, so no attendance records should be created
    assert_difference 'Attendance.count', 0 do
      # Empty array to simulate empty attendance form
      post attendances_path, params: { meeting_id: @meeting.id, attendance: [] }
    end
    # Assert that the attendance has not changed
    assert_equal 0, @meeting.attendance
    follow_redirect!
    assert_not flash.empty?
    assert_template 'meetings/show'
  end

  # Ensure attendance creation should fail if method somehow receives invalid
  #   array values
  test "invalid new attendance test" do
    get meeting_path(@meeting)
    # User_id of '-1' is invalid, so no attendances should be created
    assert_difference 'Attendance.count', 0 do
      # Invalid user_id to force error
      post attendances_path, params: { meeting_id: @meeting.id, attendance: [-1] }
    end
    # Assert that the attendance has not changed
    assert_equal 0, @meeting.attendance
    follow_redirect!
    assert_not flash.empty?
    assert_template 'meetings/show'
  end
end
