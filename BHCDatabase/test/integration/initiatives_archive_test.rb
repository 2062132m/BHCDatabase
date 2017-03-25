require 'test_helper'

class InitiativesArchiveTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @initiative = initiatives(:one)
    log_in_as(@admin)
  end

  # Ensure initiative archiving should fail if 'reason_archived' is too long
  test 'unsuccessful initiative archive' do
    get initiative_path(@initiative)
    assert_template 'initiatives/show'
    reason = 'a' * 256
    patch update_archive_initiative_path(@initiative), params: { initiative: { archived:  true, reason_archived: reason} }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_template 'initiatives/archive'
    @initiative.reload
    # Assert archived field is false
    assert_not @initiative.archived
    # Assert reason_archived field was not set
    assert_not_equal reason,  @initiative.reason_archived
  end

  # Ensure initiative is archiving successfully with correct parameters
  test 'successful initiative archive' do
    get initiative_path(@initiative)
    assert_template 'initiatives/show'
    reason = "example reason"
    patch update_archive_initiative_path(@initiative), params: { initiative: { archived:  true, reason_archived: reason} }
    assert_redirected_to @initiative
    @initiative.reload
    # Assert archived field is true
    assert @initiative.archived
    # Assert reason_archived field was not set
    assert_equal reason,  @initiative.reason_archived
  end

  # Ensure initiative can be successfully unarchived
  test 'successful initiative unarchive' do
    get initiative_path(@initiative)
    assert_template 'initiatives/show'
    reason = "example reason"
    # Start by archiving the initiative
    patch update_archive_initiative_path(@initiative), params: { initiative: { archived:  true, reason_archived: reason} }
    assert_redirected_to @initiative
    @initiative.reload
    assert @initiative.archived
    assert_equal reason,  @initiative.reason_archived
    # Unarchive the initiative
    get unarchive_initiative_path(@initiative)
    assert_redirected_to @initiative
    @initiative.reload
    # Assert archived field is false
    assert_not @initiative.archived
    # Assert reason_archived has been reset to 'nil'
    assert_not_equal reason,  @initiative.reason_archived
  end

end
