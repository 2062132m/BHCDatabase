require 'test_helper'

class MedicalConditionArchiveTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @medical_condition = medical_conditions(:one)
    log_in_as(@admin)
  end

  test "unsuccessful medical_condition archive" do
    get medical_condition_path(@medical_condition)
    assert_template 'medical_conditions/show'
    reason = 'a' * 256
    patch update_archive_medical_condition_path(@medical_condition), params: { medical_condition: { archived:  true, reason_archived: reason} }
    assert_template 'medical_conditions/archive'
    @medical_condition.reload
    assert_not @medical_condition.archived
    assert_not_equal reason,  @medical_condition.reason_archived
  end

  test "successful medical_condition archive" do
    get medical_condition_path(@medical_condition)
    assert_template 'medical_conditions/show'
    reason = "example reason"
    patch update_archive_medical_condition_path(@medical_condition), params: { medical_condition: { archived:  true, reason_archived: reason} }
    assert_redirected_to @medical_condition
    @medical_condition.reload
    assert @medical_condition.archived
    assert_equal reason,  @medical_condition.reason_archived
  end

  test "successful medical_condition unarchive" do
    get medical_condition_path(@medical_condition)
    assert_template 'medical_conditions/show'
    reason = "example reason"
    patch update_archive_medical_condition_path(@medical_condition), params: { medical_condition: { archived:  true, reason_archived: reason} }
    assert_redirected_to @medical_condition
    @medical_condition.reload
    assert @medical_condition.archived
    assert_equal reason,  @medical_condition.reason_archived
    get unarchive_medical_condition_path(@medical_condition)
    assert_redirected_to @medical_condition
    @medical_condition.reload
    assert_not @medical_condition.archived
    assert_not_equal reason,  @medical_condition.reason_archived
  end

end
