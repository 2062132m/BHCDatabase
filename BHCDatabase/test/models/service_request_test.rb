require 'test_helper'

# ServiceRequest test is the generic model test for a service request.
class ServiceRequestTest < ActiveSupport::TestCase
  def setup
    @service_request = service_requests(:one)
  end

  test 'should be valid' do
    @service_request.valid?
  end

  test 'request should be present' do
    @service_request.request = ''
    assert_not @service_request.valid?
  end

  test 'request should not be too long' do
    @service_request.request = 'a' * 65_537
    assert_not @service_request.valid?
  end

  test 'should have a user' do
    @service_request.user = nil
    assert_not @service_request.valid?
  end

  test 'allows multiple requests from a user' do
    @duplicate_request = @service_request.dup
    @duplicate_request.request = 'My new request'
    assert_not @duplicate_request.request == @service_request.request
    assert @duplicate_request.valid?, @duplicate_request.errors.full_messages
    assert_difference 'ServiceRequest.count', 1 do
      @duplicate_request.save
    end
  end
end
