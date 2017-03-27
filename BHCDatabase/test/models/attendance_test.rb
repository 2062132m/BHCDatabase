require 'test_helper'

# AttendanceTest is the model test for attendances
class AttendanceTest < ActiveSupport::TestCase
  def setup
    @attendance = attendances(:one)
  end

  test 'should be valid' do
    assert @attendance.valid?
  end

  test 'should have user' do
    @attendance.user = nil
    assert_not @attendance.valid?
  end

  test 'should have a meeting' do
    @attendance.meeting = nil
    assert_not @attendance.valid?
  end

  # Tests that duplicate attendances to a meeting are not allowed.
  test 'index on user_id and meeting_id' do
    @duplicate_attendance = @attendance.dup
    assert_not @duplicate_attendance.valid?
    assert_no_difference 'Attendance.count' do
      @duplicate_attendance.save
    end
  end
end
