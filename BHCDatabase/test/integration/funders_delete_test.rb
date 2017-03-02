require 'test_helper'

class FundersDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
    @funder1 = funders(:one)
    log_in_as @user
  end

  test 'delete funder' do
    get funder_url(@funder1)
    assert_template 'funders/show'
    assert_difference 'Funder.count', -1 do
      delete funder_url(@funder1)
    end
    assert_redirected_to funders_url
  end
end
