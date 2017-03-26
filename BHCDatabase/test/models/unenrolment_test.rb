require 'test_helper'

# UnenrolmentTest is the generic model test for an unenrolment.
class UnenrolmentTest < ActiveSupport::TestCase
  def setup
    @unenroled = unenrolments(:one)
  end

  test 'should be valid' do
    assert @unenroled.valid?
  end

  test 'should have a user' do
    @unenroled.user = nil
    assert_not @unenroled.valid?
  end

  test 'should have an initiative' do
    @unenroled.initiative = nil
    assert_not @unenroled.valid?
  end

  test 'datetime should accept valid dates' do
    valid_date = '01/01/2012 23:59:59'
    @unenroled.date_enrolled = valid_date
    assert @unenroled.date_enrolled.to_datetime.is_a?(DateTime)
  end

  test 'datetime should reject invalid dates' do
    invalid_date = '12/13/2016'
    @unenroled.date_enrolled = invalid_date
    assert_raises(Exception) { @unenroled.date_enrolled.to_datetime }
  end

  test 'should allow from same initiative' do
    @duplicate_un = @unenroled.dup
    @duplicate_un.date_enrolled = '2016-01-23 13:15:20'
    assert @duplicate_un.valid?
    assert_not @duplicate_un.date_enrolled == @unenroled.date_enrolled
    assert_difference 'Unenrolment.count', 1 do
      @duplicate_un.save
    end
  end
end
