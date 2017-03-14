require 'test_helper'

class UsersChangePasswordTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    log_in_as(@admin)
  end

  test "unsuccessful password change" do
    get user_path(@service_user)
    assert_template 'users/show'
    oldpassword = @service_user.password_digest
    newpassword = 'abc'
    patch update_password_user_path(@service_user), params: { user: { password: newpassword, password_confirmation: newpassword} }
    assert_redirected_to @service_user
    @service_user.reload
    assert_equal oldpassword, @service_user.password_digest
  end

  test "successful password change" do
    get user_path(@service_user)
    assert_template 'users/show'
    oldpassword = @service_user.password_digest
    newpassword = 'abc123'
    patch update_password_user_path(@service_user), params: { user: { password: newpassword, password_confirmation: newpassword} }
    assert_redirected_to @service_user
    @service_user.reload
    assert_not_equal oldpassword, @service_user.password_digest
  end

end
