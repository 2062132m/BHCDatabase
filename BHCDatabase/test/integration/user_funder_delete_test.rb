require 'test_helper'

class UserFunderDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @user = users(:service_user)
    @funder_two = funders(:two)
    log_in_as(@admin)
  end

  # Ensure a user funding can be deleted(removed) and that a removed
  #   user funding is created in its place
  test "delete user funder test" do
    # Start by going to the user page
    get user_path(@user)
    # Assert the number of user funding records is decremented by 1
    assert_difference 'UserFunder.count', -1 do
      # Assert the number of removed user fundings records is
      #   incremented by 1
      assert_difference 'RemovedUserFunding.count', 1 do
        get remove_user_funding_funder_path(@funder_two), params: { user_id: @user.id }
      end
    end
    follow_redirect!
    assert_not flash.empty?
    # Assert we are redirected back to the initiative's page
    assert_template 'users/show'
  end
end
