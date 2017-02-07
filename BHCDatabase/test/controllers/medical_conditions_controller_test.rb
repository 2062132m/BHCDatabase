require 'test_helper'

class MedicalConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get medical_conditions_new_url
    assert_response :success
  end

  test "should get index" do
    get medical_conditions_index_url
    assert_response :success
  end

  test "should get show" do
    get medical_conditions_show_url
    assert_response :success
  end

end
