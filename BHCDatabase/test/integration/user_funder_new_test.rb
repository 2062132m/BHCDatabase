require 'test_helper'

class UserFunderNewTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @user = users(:service_user)
    @funder_one = funders(:one)
    @funder_two = funders(:two)
    log_in_as(@admin)
  end

  test "valid new user funder test" do
    get fund_user_funder_path(@funder_one), params: { user_id: @user.id }
    assert_difference 'UserFunder.count', 1 do
      post new_fund_user_funder_path, params: { user_funder: { funder_id: @funder_one.id, user_id: @user.id } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  # Invalid in the sense that this funder is already funding the user
  test "invalid new user funder test" do
    get fund_user_funder_path(@funder_two), params: { user_id: @user.id }
    assert_no_difference 'UserFunder.count' do
      post new_fund_user_funder_path, params: { user_funder: { funder_id: @funder_two.id, user_id: @user.id } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
