require 'test_helper'

class AreasNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  test "invalid new area information" do
    get new_area_path
    assert_no_difference 'Area.count' do
      post areas_path, params: { area: {name: "", description: ""}}
    end
    assert_template 'areas/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid new area information" do
    get new_area_path
    assert_difference 'Area.count', 1 do
      post areas_path, params: { area: { name: Faker::Name.name, description: Faker::Lorem.sentence} }
    end
    follow_redirect!
    assert_template 'areas/show'
  end
end