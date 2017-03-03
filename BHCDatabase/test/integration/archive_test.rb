require 'test_helper'

class ArchiveTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:david)
    @service_user = users(:service_user)
    log_in_as(@admin)
  end

  test "successful archive" do
    get user_path(@service_user)
    assert_template 'users/show'
    reason = "example reason"
    patch update_archive_user_path(@service_user), params: { user: { archived:  true, reason_archived: reason} }
    assert_redirected_to @service_user
    @service_user.reload
    assert @service_user.archived
    assert_equal reason,  @service_user.reason_archived
  end

  test "unsuccessful archive" do
    get user_path(@service_user)
    assert_template 'users/show'
    reason = false
    patch update_archive_user_path(@service_user), params: { user: { archived:  true, reason_archived: reason} }
    assert_redirected_to @service_user
    @service_user.reload
    #assert_not @service_user.archived
    assert_not_equal reason,  @service_user.reason_archived
  end

end
