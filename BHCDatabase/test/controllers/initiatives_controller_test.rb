require 'test_helper'

class InitiativesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  test 'should get new' do
    get new_initiative_url
    assert_template 'initiatives/new'
    assert_response :success
  end

  test 'should get index' do
    get initiatives_url
    assert_response :success
    assert_template 'initiatives/index'
  end

  test 'should get initiative one' do
    one = initiatives(:one)
    get initiative_url(one)
    assert_response :success
    assert_template 'initiatives/show'
  end

  test 'should get edit' do
    one = initiatives(:one)
    get edit_initiative_url(one)
    assert_response :success
    assert_template 'initiatives/edit'
  end
end
