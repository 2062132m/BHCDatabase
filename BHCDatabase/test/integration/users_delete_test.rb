require 'test_helper'

class UsersDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    log_in_as @admin
  end

  # Ensure a user can be deleted
  test 'delete a user' do
    # Start by going to the user page
    get user_url(@service_user)
    assert_template 'users/show'
    # Assert the number of user records is decremented by 1
    assert_difference 'User.count', - 1 do
      delete user_url(@service_user)
    end
    # Assert we are redirected back to the user's index page
    assert_redirected_to users_url
    assert_not flash.empty?
  end
end
