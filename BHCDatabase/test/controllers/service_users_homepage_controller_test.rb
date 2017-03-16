require 'test_helper'

class ServiceUsersHomepageControllerTest < ActionDispatch::IntegrationTest

  def setup
    @service_user = users(:service_user)
    log_in_as @service_user
  end
  test "should get index" do
    get serviceusershome_url
    assert_response :success
  end

end
