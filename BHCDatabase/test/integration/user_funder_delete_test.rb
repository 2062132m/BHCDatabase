require 'test_helper'

class UserFunderDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @user = users(:service_user)
    @funder_one = funders(:one)
    @funder_two = funders(:two)
    log_in_as(@admin)
  end

  test "delete user funder test" do
    get user_path(@user)
    assert_difference 'UserFunder.count', -1 do
      assert_difference 'RemovedUserFunding.count', 1 do
        get remove_user_funding_funder_path(@funder_two), params: { user_id: @user.id }
      end
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
