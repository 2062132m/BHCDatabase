require 'test_helper'

class ConditionNewTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    @medical_condition = medical_conditions(:one)
    log_in_as(@admin)
  end

  test "valid new condition test" do
    get new_condition_path, params: { user_id: @service_user.id }
    assert_difference 'Condition.count', 1 do
      post conditions_path, params: { condition: { user_id: @service_user.id, medical_condition_id: @medical_condition.name } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  test "invalid new condition test" do
    get new_condition_path, params: { user_id: @service_user.id }
    assert_no_difference 'Condition.count' do
      post conditions_path, params: { condition: { user_id: @service_user.id, medical_condition_id: '' } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
