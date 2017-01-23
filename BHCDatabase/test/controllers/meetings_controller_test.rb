require 'test_helper'

class MeetingsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
    log_in_as(@user)
  end

  # test "should get new" do
  #   get meetings_new_url
  #   assert_response :success
  # end

end
