require 'test_helper'

class MedicalConditionDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
    @condition_one = medical_conditions(:one)
    @condition_two = medical_conditions(:two)
    log_in_as @user
  end

  test 'delete condition' do
    get medical_condition_url(@condition_one)
    assert_template 'medical_conditions/show'
    assert_difference 'MedicalCondition.count', -1 do
      delete medical_condition_url(@condition_one)
    end
  end

end
