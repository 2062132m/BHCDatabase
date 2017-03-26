require 'test_helper'

class ServiceRequestsDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @service_request = service_requests(:one)
    log_in_as @user
  end

  # Ensure a service request can be deleted
  test 'delete service request' do
    # Start by going to the home page
    get root_url
    # Assert the number of service request records is decremented by 1
    assert_difference 'ServiceRequest.count', -1 do
      delete service_request_url(@service_request)
    end
    # Assert we are redirected back to the home page
    assert_redirected_to root_url
    assert_not flash.empty?
  end
end
