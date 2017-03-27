require 'test_helper'

# MedicalConditionFunderTest is the model tests for MedicalConditionFunders
class MedicalConditionFunderTest < ActiveSupport::TestCase
  def setup
    @medical_condition_funder = medical_condition_funders(:two)
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

  # Tests that a funder can't fund a medical condition twice.
  test 'index on medical condition and funder' do
    @duplicate_funder = @medical_condition_funder.dup
    assert_not @duplicate_funder.valid?
    assert_no_difference 'MedicalConditionFunder.count' do
      @duplicate_funder.save
    end
  end
end
