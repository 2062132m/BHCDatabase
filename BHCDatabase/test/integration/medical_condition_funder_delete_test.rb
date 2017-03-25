require 'test_helper'

class MedicalConditionFunderDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @medical_condition = medical_conditions(:one)
    @funder_one = funders(:one)
    @funder_two = funders(:two)
    log_in_as(@admin)
  end

  test "delete medical condition funder test" do
    get medical_condition_path(@medical_condition)
    assert_difference 'MedicalConditionFunder.count', -1 do
      assert_difference 'RemovedMedicalFunding.count', 1 do
        get remove_medical_funding_funder_path(@funder_two), params: { medical_condition_id: @medical_condition.id }
      end
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'medical_conditions/show'
  end
end
