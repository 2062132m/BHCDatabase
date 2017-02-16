require 'test_helper'

class ServiceUsersHomepageControllerTest < ActionDispatch::IntegrationTest

  def setup
    @service_user = users(:service_user)
    log_in_as(@service_user)
  end
  test "should get index" do
    get service_users_homepage_index_url
    assert_response :success
  end

end
