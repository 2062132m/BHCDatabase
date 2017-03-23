require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @volunteer = users(:volunteer)
    @service_user = users(:service_user)
    log_in_as @admin
  end

  test 'unsuccessful edit' do
    get user_path(@service_user)
    assert_template 'users/show'
    patch user_path(@service_user), params: {user: {forename: @service_user.forename,
                                                    surname: '',
                                                    known_as: @service_user.known_as,
                                                    email: @service_user.email,
                                                    telephone: @service_user.telephone,
                                                    dob: @service_user.dob,
                                                    reg_date: @service_user.reg_date,
                                                    emergency_name: @service_user.emergency_name,
                                                    emergency_telephone: @service_user.emergency_telephone,
                                                    address1: @service_user.address1,
                                                    address2: @service_user.address2,
                                                    town: @service_user.town,
                                                    postcode: @service_user.postcode,
                                                    aims: @service_user.aims,
                                                    aims_other: @service_user.aims_other,
                                                    privilege: @service_user.privilege}}
    assert_template 'users/edit'
    @service_user.reload
    assert_not_equal @service_user.forename, ''

  end

  test 'successful edit' do
    get user_path(@service_user)
    assert_template 'users/show'
    surname = Faker::Name.last_name
    patch user_path(@service_user), params: {user: {forename: @service_user.forename,
                                                    surname: surname,
                                                    known_as: @service_user.known_as,
                                                    email: @service_user.email,
                                                    telephone: @service_user.telephone,
                                                    dob: @service_user.dob,
                                                    reg_date: @service_user.reg_date,
                                                    emergency_name: @service_user.emergency_name,
                                                    emergency_telephone: @service_user.emergency_telephone,
                                                    address1: @service_user.address1,
                                                    address2: @service_user.address2,
                                                    town: @service_user.town,
                                                    postcode: @service_user.postcode,
                                                    aims: @service_user.aims,
                                                    aims_other: @service_user.aims_other,
                                                    privilege: @service_user.privilege}}
    assert_not flash.empty?
    assert_redirected_to @service_user
    @service_user.reload
    assert_equal surname, @service_user.surname
  end

end
