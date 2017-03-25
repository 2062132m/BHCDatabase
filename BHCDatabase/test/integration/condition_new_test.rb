require 'test_helper'

class ConditionNewTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @service_user = users(:service_user2)
    @medical_condition_one = medical_conditions(:one)
    @medical_condition_two = medical_conditions(:two)
    log_in_as(@admin)
  end

  test 'valid new condition test' do
    get new_condition_path, params: { user_id: @service_user.id }
    assert_difference 'Condition.count', 1 do
      post conditions_path, params: { condition: { user_id: @service_user.id,
                                                   medical_condition_id: @medical_condition_one.name } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  # Where specified medical condition doesn't exist
  test 'invalid new condition test' do
    get new_condition_path, params: { user_id: @service_user.id }
    assert_no_difference 'Condition.count' do
      post conditions_path, params: { condition: { user_id: @service_user.id,
                                                   medical_condition_id: '' } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  # Where user already has specified medical condition
  test 'duplicate new condition test' do
    get new_condition_path, params: { user_id: @service_user.id }
    assert_no_difference 'Condition.count' do
      post conditions_path, params: { condition: { user_id: @service_user.id,
                                                   medical_condition_id: @medical_condition_two.name } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
