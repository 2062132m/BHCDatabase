require 'test_helper'

class InitiativeFunderDeleteTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @initiative = initiatives(:one)
    @funder_one = funders(:one)
    @funder_two = funders(:two)
    log_in_as(@admin)
  end

  test "delete initiative funder test" do
    get initiative_path(@initiative)
    assert_difference 'InitiativeFunder.count', -1 do
      get remove_initiative_funding_funder_path(@funder_two), params: { initiative_id: @initiative.id }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'initiatives/show'
  end
end
