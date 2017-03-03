require 'test_helper'

class UserArchiveTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:david)
    @service_user = users(:service_user)
    log_in_as(@admin)
  end

  test "unsuccessful user archive" do
    get user_path(@service_user)
    assert_template 'users/show'
    reason = 'a' * 50
    patch update_archive_user_path(@service_user), params: { user: { archived:  true, reason_archived: reason} }
    assert_redirected_to @service_user
    @service_user.reload
    assert_not @service_user.archived
    assert_not_equal reason,  @service_user.reason_archived
  end

  test "successful user archive" do
    get user_path(@service_user)
    assert_template 'users/show'
    reason = "example reason"
    patch update_archive_user_path(@service_user), params: { user: { archived:  true, reason_archived: reason} }
    assert_redirected_to @service_user
    @service_user.reload
    assert @service_user.archived
    assert_equal reason,  @service_user.reason_archived
  end

  test "successful user unarchive" do
    get user_path(@service_user)
    assert_template 'users/show'
    reason = "example reason"
    patch update_archive_user_path(@service_user), params: { user: { archived:  true, reason_archived: reason} }
    assert_redirected_to @service_user
    @service_user.reload
    assert @service_user.archived
    assert_equal reason,  @service_user.reason_archived
    get unarchive_user_path(@service_user)
    assert_redirected_to @service_user
    @service_user.reload
    assert_not @service_user.archived
    assert_not_equal reason,  @service_user.reason_archived
  end

end
