require 'test_helper'

class InitiativesEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @initiative = initiatives(:one)
    @area = areas(:one)
    log_in_as(@user)
  end

  # Ensure initiative editing should fail with invalid parameters
  test 'unsuccessful edit' do
    get edit_initiative_url(@initiative)
    assert_template 'initiatives/edit'
    # Name cannot be blank
    patch initiative_url(@initiative), params: {initiative: {name: '',
                                                     description: @initiative.description,
                                                     location: @initiative.location,
                                                     area: @area}}
    # Assert error message divs are displayed
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    # Assert we are redirected back to the edit page
    assert_template 'initiatives/edit'
  end

  # Ensure initiative editing is successful with valid parameters
  test "successful edit" do
    get edit_initiative_path(@initiative)
    assert_template 'initiatives/edit'
    name = 'example name'
    description = 'example description'
    location = 'example location'
    patch initiative_path(@initiative), params: {initiative: {name: name,
                                                              description: description,
                                                              location: location,
                                                              area: @area}}
    assert_not flash.empty?
    assert_redirected_to @initiative
    @initiative.reload
    # Assert name has been changed correctly
    assert_equal name, @initiative.name
    # Assert description has been changed correctly
    assert_equal description, @initiative.description
    # Assert location has been changed correctly
    assert_equal location, @initiative.location
  end
end
