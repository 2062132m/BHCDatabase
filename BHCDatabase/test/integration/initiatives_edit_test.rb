require 'test_helper'

class InitiativesEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @initiative = initiatives(:one)
    @area = areas(:one)
    log_in_as(@user)
  end

  test "successful edit" do
    get edit_initiative_path(@initiative)
    assert_template 'initiatives/edit'
    name = Faker::Address.city
    description = Faker::Lorem.paragraph
    location = Faker::Address.street_name

    patch initiative_path(@initiative), params: {initiative: {name: name,
                                                              description: description,
                                                              location: location,
                                                              area: @area}}

    assert_not flash.empty?
    assert_redirected_to @initiative
    @initiative.reload
    assert_equal name, @initiative.name
    assert_equal description, @initiative.description
    assert_equal location, @initiative.location
  end

  test 'unsuccessful edit' do
    two = initiatives(:two)
    get edit_initiative_url(two)
    assert_template 'initiatives/edit'
    name = ''

    patch initiative_url(two), params: {initiative: {name: name,
                                                     description: two.description,
                                                     location: two.location,
                                                     area: @area}}
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_template 'initiatives/edit'
  end
end
