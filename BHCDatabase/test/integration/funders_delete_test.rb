require 'test_helper'

class FundersDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @funder1 = funders(:one)
    log_in_as @user
  end

end
