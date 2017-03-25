require 'test_helper'

class MeetingsNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @volunteer = users(:volunteer)
    @initiative_one = initiatives(:one)
    @initiative_two = initiatives(:two)
    @meeting = meetings(:one)
    log_in_as(@user)
  end

  test "one new meeting test" do
    get new_meeting_path, params: { initiative_id: @initiative_one.id }
    assert_difference 'Meeting.count', 1 do
      # Create 1 meeting
      post meetings_path, params: { meeting: { initiative_id: @initiative_one.id, datetime: Time.zone.now }, weeks: 1 }
    end
    follow_redirect!
    assert_template 'meetings/show'
  end

  test "ten new meetings test" do
    get new_meeting_path, params: { initiative_id: @initiative_two.id }
    assert_difference 'Meeting.count', 10 do
      #Create 10 meetngs
      post meetings_path, params: { meeting: { initiative_id: @initiative_two.id, datetime: Time.zone.now }, weeks: 10 }
    end
    follow_redirect!
    assert_template 'meetings/show'
  end

  test "access other initiative" do
    log_in_as(@volunteer)
    get new_meeting_path, params: { initiative_id: @initiative_two.id }
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  test "access other meeting" do
    log_in_as(@volunteer)
    get meeting_path(@meeting)
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
