require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  test "should get index" do
    get questions_path
    assert_response :success
  end

  test "should show_one" do
    one = questions(:one)
    get question_url(one)
    assert_response :success
  end

  test 'should show two' do
    two = questions(:two)
    get question_url(two)
    assert_response :success
  end

  test 'should get new' do
    get new_question_url
    assert_response :success
  end

end
