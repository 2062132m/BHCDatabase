require 'test_helper'

class UsersArchiveTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    log_in_as(@admin)
  end

  # Ensure user archiving should fail if 'reason_archived' is too long
  test "unsuccessful user archive" do
    get user_path(@service_user)
    assert_template 'users/show'
    reason = 'a' * 256
    patch update_archive_user_path(@service_user), params: { user: { archived:  true, reason_archived: reason} }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_template 'users/archive'
    @service_user.reload
    # Assert archived field is false
    assert_not @service_user.archived
    # Assert reason_archived field was not set
    assert_not_equal reason,  @service_user.reason_archived
  end

  # Ensure user is archiving successfully with correct parameters
  test "successful user archive" do
    get user_path(@service_user)
    assert_template 'users/show'
    reason = "example reason"
    patch update_archive_user_path(@service_user), params: { user: { archived:  true, reason_archived: reason} }
    assert_redirected_to @service_user
    @service_user.reload
    # Assert archived field is true
    assert @service_user.archived
    # Assert reason_archived field was not set
    assert_equal reason,  @service_user.reason_archived
  end

  # Ensure user can be successfully unarchived
  test "successful user unarchive" do
    get user_path(@service_user)
    assert_template 'users/show'
    reason = "example reason"
    # Start by archiving the user
    patch update_archive_user_path(@service_user), params: { user: { archived:  true, reason_archived: reason} }
    assert_redirected_to @service_user
    @service_user.reload
    assert @service_user.archived
    assert_equal reason,  @service_user.reason_archived
    # Unarchive the user
    get unarchive_user_path(@service_user)
    assert_redirected_to @service_user
    @service_user.reload
    # Assert archived field is false
    assert_not @service_user.archived
    # Assert reason_archived has been reset to 'nil'
    assert_not_equal reason,  @service_user.reason_archived
  end

end
