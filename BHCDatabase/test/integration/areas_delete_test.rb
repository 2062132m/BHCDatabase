require 'test_helper'

class AreasDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as @user
  end

  test 'delete area' do
    one = areas(:one)
    get area_url(one)
    assert_template 'areas/show'
    assert_difference 'Area.count', -1 do
      delete area_url(one)
    end
    assert_redirected_to areas_url
  end

end
