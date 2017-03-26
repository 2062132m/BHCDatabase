require 'test_helper'

class AreasEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @area = areas(:one)
    log_in_as(@user)
  end

  # Ensure area editing should fail with invalid parameters
  test "unsuccessful edit" do
    get edit_area_path(@area)
    assert_template 'areas/edit'
    # Name/description cannot be blank
    patch area_path(@area), params: { area: { name:  '', description: ''} }
    # Assert error message divs are displayed
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    # Assert we are redirected back to the edit page
    assert_template 'areas/edit'
  end

  # Ensure area editing is successful with valid parameters
  test "successful edit" do
    get edit_area_path(@area)
    assert_template 'areas/edit'
    name = 'example city'
    description = 'example description'
    patch area_path(@area), params: { area: { name:  name, description: description} }
    assert_not flash.empty?
    assert_redirected_to @area
    @area.reload
    # Assert name has been changed correctly
    assert_equal name,  @area.name
    # Assert description has been changed correctly
    assert_equal description, @area.description
  end
end
