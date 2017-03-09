require 'test_helper'

class AreasEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @area = areas(:one)
    log_in_as(@user)
  end

  test "unsuccessful edit" do
    get edit_area_path(@area)
    assert_template 'areas/edit'
    patch area_path(@area), params: { area: { name:  '', description: ''} }

    assert_template 'areas/edit'
  end

  test "successful edit" do
    get edit_area_path(@area)
    assert_template 'areas/edit'
    name  = Faker::Address.city
    description = Faker::Lorem.paragraph

    patch area_path(@area), params: { area: { name:  name, description: description} }

    assert_not flash.empty?
    assert_redirected_to @area
    @area.reload
    assert_equal name,  @area.name
    assert_equal description, @area.description
  end
end
