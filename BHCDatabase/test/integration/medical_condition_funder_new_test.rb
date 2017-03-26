require 'test_helper'

class MedicalConditionFunderNewTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @medical_condition = medical_conditions(:one)
    @funder_one = funders(:one)
    @funder_two = funders(:two)
    log_in_as(@admin)
  end

  test "valid new medical condition funder test" do
    get fund_medical_condition_funder_path(@funder_one), params: { medical_condition_id: @medical_condition.id }
    assert_difference 'MedicalConditionFunder.count', 1 do
      post new_fund_medical_condition_funder_path, params: { medical_condition_funder: { funder_id: @funder_one.id, medical_condition_id: @medical_condition.id } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'medical_conditions/show'
  end

  # Invalid in the sense that this funder is already funding the medical condition
  test "invalid new medical condition funder test" do
    get fund_medical_condition_funder_path(@funder_two), params: { medical_condition_id: @medical_condition.id }
    assert_no_difference 'MedicalConditionFunder.count' do
      post new_fund_medical_condition_funder_path, params: { medical_condition_funder: { funder_id: @funder_two.id, medical_condition_id: @medical_condition.id } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'medical_conditions/show'
  end
end
