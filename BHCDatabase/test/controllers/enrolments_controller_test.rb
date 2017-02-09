require 'test_helper'

class EnrolmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enrolments_index_url
    assert_response :success
  end

end
