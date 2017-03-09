require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  test "should get new" do
    get areas_new_url
    assert_response :success
  end

end
