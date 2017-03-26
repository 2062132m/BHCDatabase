require 'test_helper'

# ConditionTest is the model test and validations for a condition
class ConditionTest < ActiveSupport::TestCase
  def setup
    @condition = conditions(:one)
  end

  test 'should be valid' do
    assert @condition.valid?
  end

  test 'should have a medical_conditon' do
    @condition.medical_condition = nil
    assert_not @condition.valid?, @condition.errors.full_messages.inspect
  end

  test 'should have a user' do
    @condition.user = nil
    assert_not @condition.valid?, @condition.errors.full_messages.inspect
  end

  test 'index on medical_condition and user' do
    @duplicate_condition = @condition.dup
    assert_not @duplicate_condition.valid?
    assert_no_difference 'Condition.count' do
      @duplicate_condition.save
    end
  end
end
