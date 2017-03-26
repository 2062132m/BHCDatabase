require 'test_helper'

class ConditionDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    @condition = conditions(:two)
    log_in_as(@admin)
  end

  # Ensure a condition can be deleted(removed) and that an unassigned condition
  #   is created in its place
  test "delete condition test" do
    # Start by going to the user page
    get user_path(@service_user)
    # Assert the number of condition records is decremented by 1
    assert_difference 'Condition.count', -1 do
      # Assert the number of unassigned condition records is incremented by 1
      assert_difference 'UnassignedCondition.count', 1 do
        delete condition_path(@condition)
      end
    end
    follow_redirect!
    assert_not flash.empty?
    # Assert we are redirected back to the user's page
    assert_template 'users/show'
  end
end
