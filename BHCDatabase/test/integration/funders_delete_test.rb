require 'test_helper'

class FundersDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as @user
  end

  test 'delete funder' do
    one = funders(:one)
    get funder_url(one)
    assert_template 'funders/show'
    assert_difference 'Funder.count', -1 do
      delete funder_url(one)
    end
    assert_redirected_to funders_url
  end

end
