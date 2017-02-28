require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: Faker::Name.name, email: 'user@example.com',
                     password: 'foobar', password_confirmation: 'foobar',
                     telephone: Faker::PhoneNumber.phone_number, emergency_contact: Faker::PhoneNumber.phone_number,
                     dob: Faker::Date.between(70.years.ago, 18.years.ago),
                     privilege: 1)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '     '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 51
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

  test 'should not have feedback_due' do
    @user.privilege = 1
    @user.feedback_due = Date.today >> 6
    assert_not @user.valid?
  end

  test 'telephone should be present' do
    @user.telephone = ''
    assert_not @user.valid?
  end

  test 'telephone should not be too long' do
    @user.telephone = '1' * 17
    assert_not @user.valid?
  end

  test 'emergency_contact should be present' do
    @user.privilege = 2
    @user.emergency_contact = ''
    assert_not @user.valid?
  end

  test 'emergency_contact should not be too long' do
    @user.privilege = 2
    @user.emergency_contact = '1' * 17
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
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
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
end
