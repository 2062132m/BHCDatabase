require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test 'correct user only' do
    service_user = users(:service_user)
    service_user2 = users(:service_user2)
    log_in_as service_user

    get user_path(service_user)
    assert_response :success
    assert_template 'users/show'

    get user_path(service_user2)
    assert_redirected_to service_user
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  test 'admin_only from a service user' do
    service_user = users(:service_user)
    log_in_as service_user

    get areas_url
    assert_redirected_to service_user
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  test 'admin_only from a volunteer' do
    volunteer = users(:volunteer)
    log_in_as volunteer

    get areas_url
    assert_redirected_to volunteer
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  test 'admin_only from an admin' do
    admin = users(:admin)
    log_in_as admin

    get areas_url
    assert_response :success
    assert_template 'areas/index'
  end

  test 'service_user_only' do
    admin = users(:admin)
    log_in_as admin

    get serviceusershome_url

    assert_redirected_to admin
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  test 'volunteer_only' do
    admin = users(:admin)
    log_in_as admin

    get volunteershome_url

    assert_redirected_to admin
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

end
