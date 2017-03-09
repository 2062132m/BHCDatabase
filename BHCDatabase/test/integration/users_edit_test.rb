require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @volunteer = users(:volunteer)
    @service_user = users(:service_user)
    log_in_as @user
  end

  test 'unsuccessful edit' do
    get user_path(@service_user)
    assert_template 'users/show'
    patch user_path(@service_user), params: {user: {name: '',
                                                    email: Faker::Internet.email,
                                                    telephone: Faker::PhoneNumber.phone_number,
                                                    emergency_contact: Faker::PhoneNumber.phone_number,
                                                    dob: Faker::Date.between(70.years.ago, 18.years.ago),
                                                    privilege: 2,
                                                    feedback_due: 6.months.from_now}}
    assert_not flash.empty?
    assert_redirected_to @service_user
    @service_user.reload
    assert_not_equal @service_user.name, ''

  end

  test 'successful edit' do
    get user_path(@service_user)
    assert_template 'users/show'
    name = Faker::Name.name
    patch user_path(@service_user), params: {user: {name: name,
                                                    email: @service_user.email,
                                                    telephone: @service_user.telephone,
                                                    emergency_contact: @service_user.emergency_contact,
                                                    dob: @service_user.dob,
                                                    privilege: @service_user.privilege,
                                                    feedback_due: @service_user.feedback_due}}
    assert_not flash.empty?
    assert_redirected_to @service_user
    @service_user.reload
    assert_equal name, @service_user.name
  end

end
