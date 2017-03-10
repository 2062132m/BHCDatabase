require 'test_helper'

class ConditionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

end
