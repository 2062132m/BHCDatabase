require 'test_helper'

class ServiceRequestsDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @service_request = service_requests(:one)
    log_in_as @user
  end

  test 'delete service request' do
    get root_url
    assert_difference 'ServiceRequest.count', -1 do
      delete service_request_url(@service_request)
    end
    assert_redirected_to root_url
    assert_not flash.empty?
  end

end
