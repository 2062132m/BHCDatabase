require 'test_helper'

# AttendanceTest is the model test for attendances
class AttendanceTest < ActiveSupport::TestCase
  def setup
    @attendance = attendances(:one)
  end

  test 'should be valid' do
    assert@attendance.valid?
  end

  test 'should have user' do
    @attendance.user = nil
    assert_not @attendance.valid?
  end

  test 'should have a meeting' do
    @attendance.meeting = nil
    assert_not @attendance.valid?
  end

end
