require 'test_helper'

class EnrolmentNewTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @service_user2 = users(:service_user2)
    @initiative_one = initiatives(:one)
    @initiative_two = initiatives(:two)
    log_in_as(@admin)
  end

  # Ensure you can enrol a user with valid parameters (enrolling from user page)
  test 'valid new enrolment (from user page) test' do
    get user_path(@service_user2)
    get enrol_initiative_enrolment_path, params: { user_id: @service_user2.id }
    assert_difference 'Enrolment.count', 1 do
      post enrolments_path, params: { enrolment: { initiative_id: @initiative_one.name,
                                                   user_id: @service_user2.known_as } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  # Ensure you can enrol a user with valid parameters (enrolling from initiative page)
  test 'valid new enrolment (from initiative page) test' do
    get initiative_path(@initiative_one)
    get enrol_user_enrolment_path, params: { initiative_id: @initiative_one.id }
    assert_difference 'Enrolment.count', 1 do
      post enrolments_path, params: { enrolment: { initiative_id: @initiative_one.name,
                                                   user_id: @service_user2.known_as } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  # Ensure enrolling should fail with invalid initiative
  test 'invalid new enrolment (from user page) test' do
    get user_path(@service_user2)
    get enrol_initiative_enrolment_path, params: { user_id: @service_user2.id }
    assert_no_difference 'Enrolment.count' do
      # Initiative id cannot be blank
      post enrolments_path, params: { enrolment: { initiative_id: '',
                                                   user_id: @service_user2.known_as } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  # Ensure enrolling should fail with invalid user
  test 'invalid new enrolment (from initiative page) test' do
    get initiative_path(@initiative_one)
    get enrol_user_enrolment_path, params: { initiative_id: @initiative_one.id }
    assert_no_difference 'Enrolment.count' do
      # User id cannot be blank
      post enrolments_path, params: { enrolment: { initiative_id: @initiative_one.name,
                                                   user_id: '' } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'initiatives/show'
  end

  # Ensure enrolling should fail is user is already enrolled in specified
  #   initiative
  test "duplicate enrolment test" do
    get user_path(@service_user2)
    get enrol_initiative_enrolment_path, params: { user_id: @service_user2.id }
    assert_no_difference 'Enrolment.count' do
      # Service_user2 is already enrolled in initiative_two (refer to fixtures)
      post enrolments_path, params: { enrolment: { initiative_id: @initiative_two.name,
                                                   user_id: @service_user2.known_as } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
