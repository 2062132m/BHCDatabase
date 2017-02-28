require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @david = users(:david)
    log_in_as @david
  end

  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: {name: "",
                                       email: "user@invalid",
                                       password: "foo",
                                       password_confirmation: "bar",
                                       telephone: Faker::PhoneNumber.phone_number,
                                       emergency_contact: Faker::PhoneNumber.phone_number,
                                       dob: Faker::Date.between(70.years.ago, 18.years.ago),
                                       privilege: 1}}
    end
    assert_template 'users/new'
    assert_select 'div.alert.alert-danger'
  end

  test "valid signup information" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name: "Example User",
                                       email: "user@example.com",
                                       password: "password",
                                       password_confirmation: "password",
                                       telephone: Faker::PhoneNumber.phone_number,
                                       emergency_contact: Faker::PhoneNumber.phone_number,
                                       dob: Faker::Date.between(70.years.ago, 18.years.ago),
                                       privilege: 2}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
    assert is_logged_in?
  end
end
