require 'test_helper'

class InitiativeArchiveTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @initiative = initiatives(:one)
    log_in_as(@admin)
  end

  test "unsuccessful initiative archive" do
    get initiative_path(@initiative)
    assert_template 'initiatives/show'
    reason = 'a' * 50
    patch update_archive_initiative_path(@initiative), params: { initiative: { archived:  true, reason_archived: reason} }
    assert_redirected_to @initiative
    @initiative.reload
    assert_not @initiative.archived
    assert_not_equal reason,  @initiative.reason_archived
  end

  test "successful initiative archive" do
    get initiative_path(@initiative)
    assert_template 'initiatives/show'
    reason = "example reason"
    patch update_archive_initiative_path(@initiative), params: { initiative: { archived:  true, reason_archived: reason} }
    assert_redirected_to @initiative
    @initiative.reload
    assert @initiative.archived
    assert_equal reason,  @initiative.reason_archived
  end

  test "successful initiative unarchive" do
    get initiative_path(@initiative)
    assert_template 'initiatives/show'
    reason = "example reason"
    patch update_archive_initiative_path(@initiative), params: { initiative: { archived:  true, reason_archived: reason} }
    assert_redirected_to @initiative
    @initiative.reload
    assert @initiative.archived
    assert_equal reason,  @initiative.reason_archived
    get unarchive_initiative_path(@initiative)
    assert_redirected_to @initiative
    @initiative.reload
    assert_not @initiative.archived
    assert_not_equal reason,  @initiative.reason_archived
  end

end
