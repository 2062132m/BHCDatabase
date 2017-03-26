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

  # Tests that a user cannot be enrolled for an initiative twice.
  test 'index on user and initiative' do
    @duplicate_enrolment = @enrolment.dup
    assert_not @duplicate_enrolment.valid?
    assert_no_difference 'Enrolment.count' do
      @duplicate_enrolment.save
    end
  end
end
