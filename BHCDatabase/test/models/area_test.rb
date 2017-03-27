require 'test_helper'

# AreaTest is the generic model test for an area.
class AreaTest < ActiveSupport::TestCase
  def setup
    @area = areas(:one)
  end

  test 'should be valid' do
    assert @area.valid?
  end

  test 'name should be present' do
    @area.name = ''
    assert_not @area.valid?
  end

  test 'description should be present' do
    @area.description = ''
    assert_not @area.valid?
  end

  test 'name should not be too long' do
    @area.name = 'a' * 256
    assert_not @area.valid?
  end

  test 'description should not be too long' do
    @area.description = 'a' * 65_537
    assert_not @area.valid?
  end

  # Tests that duplicate area names are not allowed.
  test 'index on name' do
    @area2 = Area.new(name: @area.name, description: 'Fake description')
    assert_not @area2.description == @area.description
    assert @area2.name == @area.name
    assert_not @area2.valid?
    assert_no_difference 'Area.count' do
      @area2.save
    end
  end
end
