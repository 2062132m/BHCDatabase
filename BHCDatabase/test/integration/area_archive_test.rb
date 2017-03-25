require 'test_helper'

class AreaArchiveTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @area = areas(:one)
    log_in_as(@admin)
  end

  # Ensure area archiving should fail if 'reason_archived' is too long
  test "unsuccessful area archive" do
    get area_path(@area)
    assert_template 'areas/show'
    reason = 'a' * 256
    patch update_archive_area_path(@area), params: { area: { archived:  true, reason_archived: reason} }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_template 'areas/archive'
    @area.reload
    # Assert archived field is false
    assert_not @area.archived
    # Assert reason_archived field was not set
    assert_not_equal reason,  @area.reason_archived
  end

  # Ensure area is archiving successfully with correct parameters
  test "successful area archive" do
    get area_path(@area)
    assert_template 'areas/show'
    reason = "example reason"
    patch update_archive_area_path(@area), params: { area: { archived:  true, reason_archived: reason} }
    assert_redirected_to @area
    @area.reload
    # Assert archived field is true
    assert @area.archived
    # Assert reason_archived was set and is equal to 'reason'
    assert_equal reason,  @area.reason_archived
  end

  # Ensure area can be successfully unarchived
  test "successful area unarchive" do
    get area_path(@area)
    assert_template 'areas/show'
    reason = "example reason"
    # Start by archiving the area
    patch update_archive_area_path(@area), params: { area: { archived:  true, reason_archived: reason} }
    assert_redirected_to @area
    @area.reload
    assert @area.archived
    assert_equal reason,  @area.reason_archived
    # Unarchive the area
    get unarchive_area_path(@area)
    assert_redirected_to @area
    @area.reload
    # Assert archived field is false
    assert_not @area.archived
    # Assert reason_archived has been reset to 'nil'
    assert_not_equal reason,  @area.reason_archived
  end
end
