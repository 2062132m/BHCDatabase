require 'test_helper'

class ConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get conditions_new_url
    assert_response :success
  end

end
