require 'test_helper'

class InitiativeFunderDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @initiative = initiatives(:one)
    @funder_two = funders(:two)
    log_in_as(@admin)
  end

  # Ensure an initiative funding can be deleted(removed) and that a removed
  #   initiative funding is created in its place
  test "delete initiative funder test" do
    # Start by going to the initiative page
    get initiative_path(@initiative)
    # Assert the number of initiative funding records is decremented by 1
    assert_difference 'InitiativeFunder.count', -1 do
      # Assert the number of removed initiative fundings records is
      #   incremented by 1
      assert_difference 'RemovedInitiativeFunding.count', 1 do
        get remove_initiative_funding_funder_path(@funder_two), params: { initiative_id: @initiative.id }
      end
    end
    follow_redirect!
    assert_not flash.empty?
    # Assert we are redirected back to the initiative's page
    assert_template 'initiatives/show'
  end
end
