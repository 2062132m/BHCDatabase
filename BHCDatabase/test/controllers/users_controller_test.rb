require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should get edit' do
    service_user = users(:service_user)
    get edit_user_url(service_user)
    assert_response :success
  end

  test 'should get service_user' do
    service_user = users(:service_user)
    get user_url(service_user)
    assert_response :success
    assert_template 'users/show'
  end

  test 'should get volunteer' do
    volunteer = users(:volunteer)
    get user_url(volunteer)
    assert_response :success
    assert_template 'users/show'
  end

  test 'should get david' do
    david = users(:admin)
    get user_url(david)
    assert_response :success
    assert_template 'users/show'
  end

end
