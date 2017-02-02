require 'test_helper'

class AreaShowTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
    log_in_as(@user)
    @area = areas(:one)
  end

  test "delete link" do
    get area_path(@area)
    assert_template 'areas/show'
    assert_difference 'Area.count', -1 do
      delete area_path(@area)
    end
  end

end
