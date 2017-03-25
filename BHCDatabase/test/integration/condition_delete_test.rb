require 'test_helper'

class ConditionDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    @medical_condition_one = medical_conditions(:one)
    @medical_condition_two = medical_conditions(:two)
    log_in_as(@admin)
  end

  test "delete condition test" do
    get user_path(@service_user)
  end
end
