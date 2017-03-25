require 'test_helper'

class MedicalConditionFunderDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @medical_condition = medical_conditions(:one)
    @funder_two = funders(:two)
    log_in_as(@admin)
  end

  # Ensure a medical funding can be deleted(removed) and that a removed
  #   medical funding is created in its place
  test "delete medical condition funder test" do
    # Start by going to the medical condition page
    get medical_condition_path(@medical_condition)
    # Assert the number of medical funding records is decremented by 1
    assert_difference 'MedicalConditionFunder.count', -1 do
      # Assert the number of removed medical fundings records is
      #   incremented by 1
      assert_difference 'RemovedMedicalFunding.count', 1 do
        get remove_medical_funding_funder_path(@funder_two), params: { medical_condition_id: @medical_condition.id }
      end
    end
    follow_redirect!
    assert_not flash.empty?
    # Assert we are redirected back to the medical condition's page
    assert_template 'medical_conditions/show'
  end
end
