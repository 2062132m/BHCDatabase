require 'test_helper'

class InitiativeFunderNewTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @initiative = initiatives(:one)
    @funder_one = funders(:one)
    @funder_two = funders(:two)
    log_in_as(@admin)
  end

  test "valid new initiative funder test" do
    get fund_initiative_funder_path(@funder_one), params: { initiative_id: @initiative.id }
    assert_difference 'InitiativeFunder.count', 1 do
      post new_fund_initiative_funder_path, params: { initiative_funder: { funder_id: @funder_one.id, initiative_id: @initiative.id } }
    end
  end

  # Invalid in the sense that this funder is already funding the initiative
  test "invalid new initiative funder test" do
    get fund_initiative_funder_path(@funder_two), params: { initiative_id: @initiative.id }
    assert_no_difference 'InitiativeFunder.count' do
      post new_fund_initiative_funder_path, params: { initiative_funder: { funder_id: @funder_two.id, initiative_id: @initiative.id } }
    end
  end
end
