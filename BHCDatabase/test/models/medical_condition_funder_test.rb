require 'test_helper'

# MedicalConditionFunderTest is the model tests for MedicalConditionFunders
class MedicalConditionFunderTest < ActiveSupport::TestCase
  def setup
    @medical_condition_funder = medical_condition_funders(:one)
  end

  test 'should be valid' do
    assert @medical_condition_funder.valid?
  end

  test 'funder should be present' do
    @medical_condition_funder.funder = nil
    assert_not @medical_condition_funder.valid?
  end

  test 'medical_condition should be present' do
    @medical_condition_funder.medical_condition = nil
    assert_not @medical_condition_funder.valid?
  end
end
