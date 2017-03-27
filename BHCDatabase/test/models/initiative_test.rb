require 'test_helper'

# InitiativeTest model contains the model tests for an Initiative
class InitiativeTest < ActiveSupport::TestCase
  def setup
    @area = areas(:one)
    @initiative = initiatives(:one)
  end

  test 'should be valid' do
    assert @initiative.valid?
  end

  test 'name should be present' do
    @initiative.name = ''
    assert_not @initiative.valid?
  end

  test 'description should be present' do
    @initiative.description = ''
    assert_not @initiative.valid?
  end

  test 'location should be present' do
    @initiative.location = ''
    assert_not @initiative.valid?
  end

  test 'area_id should be present' do
    @initiative.area_id = nil
    assert_not @initiative.valid?
  end

  test 'location should not be too long' do
    @initiative.location = 'a' * 65_537
    assert_not @initiative.valid?
  end

  test 'name should not be too long' do
    @initiative.name = 'a' * 256
    assert_not @initiative.valid?
  end

  test 'description should not be too long' do
    @initiative.description = 'a' * 65_537
    assert_not @initiative.valid?
  end

  # Tests that two initiatives can't have the same name and location.
  test 'index on name and location' do
    @duplicate_initiative = @initiative.dup
    assert @duplicate_initiative.name == @initiative.name
    assert @duplicate_initiative.location == @initiative.location
    assert_not @duplicate_initiative.valid?
    assert_no_difference 'Initiative.count' do
      @duplicate_initiative.save
    end
  end
end
