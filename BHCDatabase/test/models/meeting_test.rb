require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  def setup
    @area = Area.create(name: "Example Area", description: "Example description")
    @initiative = Initiative.create(name: "Example Initiative",
    description: "Example description.", area_id: @area.id, location: "TestTest")
    @meeting = @initiative.meetings.create(datetime: Time.now)
  end

  test "should be valid" do
    assert @meeting.valid?
  end

  test "datetime should be present" do
    @meeting.datetime = nil
    assert_not @meeting.valid?
  end

  test "initiative_id should be present" do
    @meeting.initiative_id = nil
    assert_not @meeting.valid?
  end

  test "datetime should accept valid dates" do
    valid_date = "01/01/2012 23:59:59"
    @meeting.datetime = valid_date
    assert @meeting.datetime.to_datetime.is_a?(DateTime)
  end

  test "datetime should reject invalid dates" do
    invalid_date = "12/13/2016"
    @meeting.datetime = invalid_date
    assert_raises(Exception){@meeting.datetime.to_datetime}
  end

end
