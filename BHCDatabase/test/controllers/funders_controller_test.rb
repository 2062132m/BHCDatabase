require 'test_helper'

class FundersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  test "should get index" do
    get funders_url
    assert_response :success
  end

  test "should get new" do
    get new_funder_url
    assert_response :success
  end

  test "should get edit" do
    one = funders(:one)
    get edit_funder_url(one)
    assert_response :success
  end

end
