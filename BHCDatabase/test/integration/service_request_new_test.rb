require 'test_helper'

class ServiceRequestsNewTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @service_user = users(:service_user)
    log_in_as(@user)
  end

  test 'valid new service request' do
    get new_service_request_path
    assert_difference 'ServiceRequest.count', 1 do
      post service_requests_path, params: { service_request: { user_id: @service_user.id, request: 'example' } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  test 'invalid new service request' do
    get new_service_request_path
    assert_no_difference 'ServiceRequest.count' do
      post service_requests_path, params: { service_request: { user_id: @service_user.id, request: 'a' * 65537 } }
    end
    assert_template 'service_requests/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
end
