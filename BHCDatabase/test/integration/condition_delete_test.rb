require 'test_helper'

class ConditionDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    @condition = conditions(:two)
    log_in_as(@admin)
  end

  # Remove a condition and ensure a unassigned condition is also created
  test "delete condition test" do
    get user_path(@service_user)
    assert_difference 'Condition.count', -1 do
      assert_difference 'UnassignedCondition.count', 1 do
        delete condition_path(@condition)
      end
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
