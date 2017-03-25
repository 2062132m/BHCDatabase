require 'test_helper'

class EnrolmentDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    @enrolment = enrolments(:two)
    log_in_as(@admin)
  end

  # Ensure an enrolment can be deleted(removed) and that an unenrolment
  #   is created in its place
  test "delete enrolment test" do
    # Start by going to the user page
    get user_path(@service_user)
    # Assert the number of enrolment records is decremented by 1
    assert_difference 'Enrolment.count', -1 do
      # Assert the number of unenrolment records is incremented by 1
      assert_difference 'Unenrolment.count', 1 do
        delete enrolment_path(@enrolment)
      end
    end
    follow_redirect!
    assert_not flash.empty?
    # Assert we are redirected back to the user's page
    assert_template 'users/show'
  end
end
