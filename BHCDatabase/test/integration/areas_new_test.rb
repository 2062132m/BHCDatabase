require 'test_helper'

class AreasNewTest < ActionDispatch::IntegrationTest

  test "invalid new area information" do
    get new_area_path
    assert_no_difference 'Area.count' do
      post areas_path, params: { area: {name: "", description: ""}}
    end
    assert_template 'areas/new'
  end


end
