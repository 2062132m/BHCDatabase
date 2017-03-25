require 'test_helper'

class AreasDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @area = areas(:one)
    log_in_as @user
  end

  # Ensure an area can be deleted
  test 'delete area' do
    # Start by going to the area page
    get area_url(@area)
    assert_template 'areas/show'
    # Assert the number of area records is decremented by 1
    assert_difference 'Area.count', -1 do
      delete area_url(@area)
    end
    # Assert we are redirected back to the area's index page
    assert_redirected_to areas_url
    assert_not flash.empty?
  end
end
