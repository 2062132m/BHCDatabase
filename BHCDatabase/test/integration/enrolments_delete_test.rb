require 'test_helper'

class EnrolmentDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    @enrolment = enrolments(:two)
    log_in_as(@admin)
  end

  # Remove an enrolment and ensure the history is saved
  test "delete enrolment test" do
    get user_path(@service_user)
    assert_difference 'Enrolment.count', -1 do
      assert_difference 'Unenrolment.count', 1 do
        delete enrolment_path(@enrolment)
      end
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
