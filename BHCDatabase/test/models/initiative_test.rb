require 'test_helper'

class InitiativeTest < ActiveSupport::TestCase
  def setup
    @area = Area.create(name: "Example Area", description: "Example description")
    @initiative = Initiative.new(name: "Example Initiative",
    description: "Example description.", area_id: @area.id)
  end

  test "should be valid" do
    assert @initiative.valid?
  end

  test "name should be present" do
    @initiative.name = ""
    assert_not @initiative.valid?
  end

  test "description should be present" do
    @initiative.description = ""
    assert_not @initiative.valid?
  end

  test "name should not be too long" do
    @initiative.name = "a" * 51
    assert_not @initiative.valid?
  end

  test "description should not be too long" do
    @initiative.description = "a" * 256
    assert_not @initiative.valid?
  end
end
