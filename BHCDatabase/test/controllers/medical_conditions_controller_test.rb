require 'test_helper'

class MedicalConditionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  test 'should get new' do
    get new_medical_condition_url
    assert_response :success
  end

  test 'should get index' do
    get medical_conditions_path
    assert_response :success
  end

end
