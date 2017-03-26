require 'test_helper'

class AreasNewTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  # Ensure area creation should fail with invalid parameters
  test "invalid new area information" do
    get new_area_path
    # Assert area record count is not increased when an area is created with
    #   invalid paramaters
    assert_no_difference 'Area.count' do
      # Name/description cannot be blank
      post areas_path, params: { area: { name: '', description: '' } }
    end
    # Assert error message divs are displayed
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    # Assert we are redirected back to the new page
    assert_template 'areas/new'
  end

  # Ensure area creation is successful with valid parameters
  test "valid new area information" do
    get new_area_path
    # Assert area record count is incremented by 1 when an area is created with
    #   valid paramaters
    assert_difference 'Area.count', 1 do
      post areas_path, params: { area: { name: 'example name', description: 'example description' } }
    end
    follow_redirect!
    assert_template 'areas/show'
  end
end
