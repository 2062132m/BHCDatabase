require 'test_helper'

class InitiativesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  test "should get new" do
    get initiatives_new_url
    assert_response :success
  end

end
