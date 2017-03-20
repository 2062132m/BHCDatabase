require 'test_helper'

class AreaArchiveTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @area = areas(:one)
    log_in_as(@admin)
  end

  test "unsuccessful area archive" do
    get area_path(@area)
    assert_template 'areas/show'
    reason = 'a' * 256
    patch update_archive_area_path(@area), params: { area: { archived:  true, reason_archived: reason} }
    assert_redirected_to @area
    @area.reload
    assert_not @area.archived
    assert_not_equal reason,  @area.reason_archived
  end

  test "successful area archive" do
    get area_path(@area)
    assert_template 'areas/show'
    reason = "example reason"
    patch update_archive_area_path(@area), params: { area: { archived:  true, reason_archived: reason} }
    assert_redirected_to @area
    @area.reload
    assert @area.archived
    assert_equal reason,  @area.reason_archived
  end

  test "successful area unarchive" do
    get area_path(@area)
    assert_template 'areas/show'
    reason = "example reason"
    patch update_archive_area_path(@area), params: { area: { archived:  true, reason_archived: reason} }
    assert_redirected_to @area
    @area.reload
    assert @area.archived
    assert_equal reason,  @area.reason_archived
    get unarchive_area_path(@area)
    assert_redirected_to @area
    @area.reload
    assert_not @area.archived
    assert_not_equal reason,  @area.reason_archived
  end

end
