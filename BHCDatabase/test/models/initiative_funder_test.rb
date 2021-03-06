require 'test_helper'

# InitiativeFunderTest is the models for an initiative funder
class InitiativeFunderTest < ActiveSupport::TestCase
  def setup
    @initiative_funder = initiative_funders(:two)
  end

  test 'should be valid' do
    assert @initiative_funder.valid?
  end

  test 'should have a funder' do
    @initiative_funder.funder = nil
    assert_not @initiative_funder.valid?
  end

  test 'should have an initiative' do
    @initiative_funder.initiative = nil
    assert_not @initiative_funder.valid?
  end

  # Tests that a funder can't fund an initiative twice.
  test 'index on funder and initiative' do
    @duplicate_funder = @initiative_funder.dup
    assert_not @duplicate_funder.valid?
    assert_no_difference 'InitiativeFunder.count' do
      @duplicate_funder.save
    end
  end
end
