require 'test_helper'

class VolunteersHomepageControllerTest < ActionDispatch::IntegrationTest
  def setup
    @volunteer = users(:volunteer)
    log_in_as @volunteer
  end

  test "should get index" do
    get volunteershome_url
    assert_response :success
  end
end
