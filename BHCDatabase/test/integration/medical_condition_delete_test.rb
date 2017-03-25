require 'test_helper'

class MedicalConditionDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @condition = medical_conditions(:one)
    log_in_as @user
  end

  # Ensure an medical condition can be deleted
  test 'delete medical condition' do
    # Start by going to the medical condition page
    get medical_condition_url(@condition)
    assert_template 'medical_conditions/show'
    # Assert the number of medical condition records is decremented by 1
    assert_difference 'MedicalCondition.count', -1 do
      delete medical_condition_url(@condition)
    end
    # Assert we are redirected back to the medical condtion's index page
    assert_redirected_to medical_conditions_url
    assert_not flash.empty?
  end

end
