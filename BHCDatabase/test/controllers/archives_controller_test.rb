require 'test_helper'

class ArchivesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
    log_in_as(@user)
  end
  
  test "should get index" do
    get archives_index_url
    assert_response :success
  end

end
