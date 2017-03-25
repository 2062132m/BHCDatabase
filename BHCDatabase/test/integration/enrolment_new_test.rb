require 'test_helper'

class EnrolmentNewTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    @initiative_one = initiatives(:one)
    @initiative_two = initiatives(:two)
    log_in_as(@admin)
  end

  test "valid new enrolment (from user page) test" do
    get user_path(@service_user)
    get enrol_initiative_enrolment_path, params: { user_id: @service_user.id }
    assert_difference 'Enrolment.count', 1 do
      post enrolments_path, params: { enrolment: { initiative_id: @initiative_one.name, user_id: @service_user.known_as } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  test "valid new enrolment (from initiative page) test" do
    get user_path(@service_user)
    get enrol_user_enrolment_path, params: { initiative_id: @initiative_one.id }
    assert_difference 'Enrolment.count', 1 do
      post enrolments_path, params: { enrolment: { initiative_id: @initiative_one.name, user_id: @service_user.known_as } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  # Where specified initiative doesn't exist
  test "invalid new enrolment test" do
    get user_path(@service_user)
    get enrol_initiative_enrolment_path, params: { user_id: @service_user.id }
    assert_no_difference 'Enrolment.count' do
      post enrolments_path, params: { enrolment: { initiative_id: '', user_id: @service_user.known_as } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
