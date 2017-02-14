require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
    log_in_as(@user)
  end

  test "should get index" do
    get questions_path
    assert_response :success
  end

end
