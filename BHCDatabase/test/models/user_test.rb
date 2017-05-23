require 'test_helper'

# UserTest is the model test for a generic user.
class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(forename: Faker::Name.first_name,
                     surname: Faker::Name.last_name,
                     known_as: Faker::LordOfTheRings.character,
                     email: 'user@example.com',
                     password: 'foobar',
                     password_confirmation: 'foobar',
                     telephone: Faker::PhoneNumber.phone_number,
                     dob: Faker::Date.between(70.years.ago, 18.years.ago),
                     reg_date: Faker::Date.between(2.years.ago, 1.weeks.ago),
                     emergency_name: Faker::Name.name,
                     emergency_telephone: Faker::PhoneNumber.phone_number,
                     address1: Faker::Address.street_address,
                     address2: Faker::Address.secondary_address,
                     town: Faker::Address.city,
                     postcode: Faker::Address.postcode,
                     aims: 0,
                     aims_other: Faker::Lorem.sentence,
                     feedback_due: Time.zone.now,
                     privilege: 1)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'forename should be present' do
    @user.forename = ''
    assert_not @user.valid?
  end

  test 'forename should not be too long' do
    @user.forename = 'a' * 256
    assert_not @user.valid?
  end

  test 'surname should be present' do
    @user.surname = ''
    assert_not @user.valid?
  end

  test 'surname should not be too long' do
    @user.surname = 'a' * 256
    assert_not @user.valid?
  end

  test 'dob should be present' do
    @user.dob = ''
    assert_not @user.valid?
  end

  test 'dob should be before today' do
    @user.dob = Date.today
    assert_not @user.valid?
    @user.dob = Date.today >> 6
    assert_not @user.valid?
  end

  test 'privilege should be present' do
    @user.privilege = nil
    assert_not @user.valid?
  end

  test 'invalid privilege level' do
    @user.privilege = -1
    assert_not @user.valid?
    @user.privilege = 3
    assert_not @user.valid?
    @user.privilege = Faker::Lorem.word
    assert_not @user.valid?
  end

  test 'should have feedback_due' do
    @user.privilege = 2
    @user.feedback_due = nil
    assert_not @user.valid?
  end

  test 'does not need to have feedback_due' do
    @user.privilege = 0
    @user.feedback_due = nil
    assert @user.valid?
  end

  test 'telephone should be present' do
    @user.telephone = ''
    assert_not @user.valid?
  end

  test 'telephone should not be too long' do
    @user.telephone = '1' * 256
    assert_not @user.valid?
  end

  test 'emergency_name should be present' do
    @user.privilege = 2
    @user.emergency_name = ''
    assert_not @user.valid?
  end

  test 'emergency_name should not be too long' do
    @user.privilege = 2
    @user.emergency_name = 'a' * 256
    assert_not @user.valid?
  end

  test 'emergency_telephone should be present' do
    @user.privilege = 2
    @user.emergency_name = ''
    assert_not @user.valid?
  end

  test 'emergency_telephone should not be too long' do
    @user.privilege = 2
    @user.emergency_telephone = '1' * 256
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '     '
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn)
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w(user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com)
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email addresses should be saved as lower-case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'address1 should be present' do
    @user.address1 = ''
    assert_not @user.valid?
  end

  test 'address1 should not be too long' do
    @user.address1 = 'a' * 256
    assert_not @user.valid?
  end

  test 'address2 does not need to be present' do
    @user.address2 = ''
    assert @user.valid?
  end

  test 'address2 should not be too long' do
    @user.address2 = 'a' * 256
    assert_not @user.valid?
  end

  test 'town should be present' do
    @user.town = ''
    assert_not @user.valid?
  end

  test 'town should not be too long' do
    @user.town = 'a' * 256
    assert_not @user.valid?
  end

  test 'postcode should be present' do
    @user.postcode = ''
    assert_not @user.valid?
  end

  test 'postcode should not be too long' do
    @user.postcode = 'k' * 256
    assert_not @user.valid?
  end

  test 'aims should be present for non admin' do
    @user.privilege = 1
    assert @user.valid?
    @user.aims = nil
    @user.privilege = 0
    assert @user.valid?
  end

  test 'aims_other should not be too long' do
    @user.aims_other = 'a' * 256
    @user.valid?
  end

  test 'prevent attending should be present for non admin' do
    @user.privilege = 0
    @user.prevent_attending = nil
    assert @user.valid?
    @user.privilege = 1
    assert @user.valid?
  end

  test 'prevent_attending should not be too long' do
    @user.prevent_attending = 'a' * 256
    assert_not @user.valid?
  end

  test 'reg_date should be present' do
    @user.reg_date = ''
    assert_not @user.valid?
  end

  test 'chi should not be longer than 10' do
    @user.chi = '0' * 11
    assert_not @user.valid?
  end
end
