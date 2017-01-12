require 'test_helper'

class AreaTest < ActiveSupport::TestCase
  def setup
    @area = Area.new(name: "Example Area", description: "Example description.")
  end

  test "should be valid" do
    assert @area.valid?
  end

  test "name should be present" do
    @area.name = ""
    assert_not @area.valid?
  end

  test "description should be present" do
    @area.description = ""
    assert_not @area.valid?
  end

  test "name should not be too long" do
    @area.name = "a" * 51
    assert_not @area.valid?
  end

  test "description should not be too long" do
    @area.description = "a" * 256
    assert_not @area.valid?
  end
end
