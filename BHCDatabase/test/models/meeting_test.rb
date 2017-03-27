require 'test_helper'

# MeetingTest is the model test for a generic meeting/session.
class MeetingTest < ActiveSupport::TestCase
  def setup
    @area = Area.create(name: 'Example Area',
                        description: 'Example description')
    @initiative = Initiative.create(name: 'Example Initiative',
                                    description: 'Example description.',
                                    area_id: @area.id, location: 'TestTest')
    @meeting = @initiative.meetings.create(datetime: Time.now)
  end

  test 'should be valid' do
    assert @meeting.valid?
  end

  test 'datetime should be present' do
    @meeting.datetime = nil
    assert_not @meeting.valid?
  end

  test 'initiative_id should be present' do
    @meeting.initiative_id = nil
    assert_not @meeting.valid?
  end

  test 'datetime should accept valid dates' do
    valid_date = '01/01/2012 23:59:59'
    @meeting.datetime = valid_date
    assert @meeting.datetime.to_datetime.is_a?(DateTime)
  end

  test 'datetime should reject invalid dates' do
    invalid_date = '12/13/2016'
    @meeting.datetime = invalid_date
    assert_raises(Exception) { @meeting.datetime.to_datetime }
  end

  # Tests that two meetings for an initiative at can't happen at the same time.
  test 'index on initiative and time' do
    @duplicate_meeting = @meeting.dup
    assert @duplicate_meeting.datetime == @meeting.datetime
    assert @duplicate_meeting.initiative == @meeting.initiative
    assert_not @duplicate_meeting.valid?
    assert_no_difference 'Meeting.count' do
      @duplicate_meeting.save
    end
  end
end
