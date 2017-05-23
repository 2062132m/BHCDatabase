require 'test_helper'

class UsersNewTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    log_in_as @admin
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
      post users_path, params: {user: {forename: "Example",
                                       surname: "User",
                                       known_as: Faker::LordOfTheRings.character,
                                       email: 'user@example.com',
                                       password: 'password',
                                       password_confirmation: 'password',
                                       telephone: Faker::PhoneNumber.phone_number,
                                       dob: Faker::Date.between(70.years.ago, 18.years.ago),
                                       reg_date: Faker::Date.between(2.years.ago, 1.weeks.ago),
                                       emergency_name: Faker::Name.name,
                                       emergency_telephone: Faker::PhoneNumber.phone_number,
                                       address1: Faker::Address.street_address,
                                       address2: Faker::Address.secondary_address,
                                       town: Faker::Address.city,
                                       postcode: Faker::Address.postcode,
                                       aims: User.aims.first,
                                       aims_other: Faker::Lorem.sentence,
                                       privilege: 2,
                                       chi: '9999999999'}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
    assert is_logged_in?
  end
end
