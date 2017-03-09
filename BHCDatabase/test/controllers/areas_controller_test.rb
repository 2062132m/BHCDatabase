require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  test 'should get index' do
    get areas_url
    assert_response :success
    assert_template 'areas/index'
  end

  test 'should get new' do
    get areas_new_url
    assert_response :success
    assert_template 'areas/new'
  end

  test 'should get edit' do
    area = areas(:one)
    get edit_area_url(area)
    assert_response :success
    assert_template 'areas/edit'
  end

  test 'should get show' do
    area = areas(:one)
    get area_url(area)
    assert_response :success
    assert_template 'areas/show'
  end

end
