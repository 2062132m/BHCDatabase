require 'test_helper'

# MedicalConditionTest contains the model tests for a generic MedicalCondition
class MedicalConditionTest < ActiveSupport::TestCase
  def setup
    @condition = medical_conditions(:one)
  end

  test 'should be valid' do
    assert @condition.valid?
  end

  test 'name should be present' do
    @condition.name = ''
    assert_not @condition.valid?
  end

  test 'name cannot be too long' do
    @condition.name = 'a' * 256
    assert_not @condition.valid?
  end

  test 'description should be present' do
    @condition.description = ''
    assert_not @condition.valid?
  end

  test 'description cannot be too long' do
    @condition.description = 'a' * 65_537
    assert_not @condition.valid?
  end

  test 'name should be unique' do
    duplicate_condition = @condition.dup
    duplicate_condition.name = @condition.name.upcase
    @condition.save
    assert_not duplicate_condition.valid?
  end
end
