require 'test_helper'

class ServiceUsersHomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get service_users_homepage_index_url
    assert_response :success
  end

end
