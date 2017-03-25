require 'test_helper'

class InitiativesDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @initiative = initiatives(:one)
    log_in_as @admin
  end

  # Ensure an initiative can be deleted
  test 'delete initiative' do
    # Start by going to the initiative page
    get initiative_url(@initiative)
    assert_template 'initiatives/show'
    # Assert the number of initiative records is decremented by 1
    assert_difference 'Initiative.count', -1 do
      delete initiative_url(@initiative)
    end
    # Assert we are redirected back to the initiative's index page
    assert_redirected_to initiatives_url
    assert_not flash.empty?
  end
end
