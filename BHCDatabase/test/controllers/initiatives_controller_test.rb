require 'test_helper'

class InitiativesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get initiatives_new_url
    assert_response :success
  end

end
