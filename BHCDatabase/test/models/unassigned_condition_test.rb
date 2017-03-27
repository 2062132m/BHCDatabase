require 'test_helper'

# UnassignedConditionTest is the model test for a generic unassigned condition.
class UnassignedConditionTest < ActiveSupport::TestCase
  def setup
    @un_condition = unassigned_conditions(:one)
  end

  test 'should be valid' do
    assert @un_condition.valid?
  end

  test 'should have a user' do
    @un_condition.user = nil
    assert_not @un_condition.valid?
  end

  test 'should have a medical_condition' do
    @un_condition.medical_condition = nil
    assert_not @un_condition.valid?
  end

  test 'datetime should accept valid dates' do
    valid_date = '01/01/2012 23:59:59'
    @un_condition.date_assigned = valid_date
    assert @un_condition.date_assigned.to_datetime.is_a?(DateTime)
  end

  test 'datetime should reject invalid dates' do
    invalid_date = '12/13/2016'
    @un_condition.date_assigned = invalid_date
    assert_raises(Exception) { @un_condition.date_assigned.to_datetime }
  end

  test 'should accept duplicate entries' do
    @duplicate_un = @un_condition.dup
    assert @duplicate_un.valid?
    assert_difference 'UnassignedCondition.count', 1 do
      @duplicate_un.save
    end
  end
end
