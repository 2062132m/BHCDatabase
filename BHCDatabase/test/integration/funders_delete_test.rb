require 'test_helper'

class FundersDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @funder = funders(:one)
    log_in_as @user
  end

  # Ensure a funder can be deleted
  test 'delete funder' do
    # Start by going to the funder page
    get funder_url(@funder)
    assert_template 'funders/show'
    # Assert the number of funder records is decremented by 1
    assert_difference 'Funder.count', -1 do
      delete funder_url(@funder)
    end
    # Assert we are redirected back to the funder's index page
    assert_redirected_to funders_url
    assert_not flash.empty?
  end
end
