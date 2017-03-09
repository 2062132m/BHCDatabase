require 'test_helper'

class UsersDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    log_in_as @admin
  end

  test 'delete a user' do
    get user_url(@service_user)
    assert_template 'users/show'
    assert_difference 'User.count', - 1 do
      delete user_url(@service_user)
    end
    assert_redirected_to users_url
  end
end
