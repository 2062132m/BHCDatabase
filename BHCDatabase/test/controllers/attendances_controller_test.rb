require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:david)
    log_in_as(@user)
  end

  test "should get new" do
    get attendances_new_url
    assert_response :success
  end

end
