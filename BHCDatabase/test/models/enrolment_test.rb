require 'test_helper'

# EnrolmentTest is the generic model test for enrolments
class EnrolmentTest < ActiveSupport::TestCase
  def setup
    @enrolment = enrolments(:one)
  end

  test 'should be valid' do
    assert @enrolment.valid?
  end

  test 'should have a user' do
    @enrolment.user = nil
    assert_not @enrolment.valid?
  end

  test 'should have an initiative' do
    @enrolment.initiative = nil
    assert_not @enrolment.valid?
  end
end
