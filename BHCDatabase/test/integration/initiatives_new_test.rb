require 'test_helper'

class InitiativesNewTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @volunteer = users(:volunteer)
    @initiative = initiatives(:one)
    log_in_as(@user)
  end

  test 'invalid new initiative information' do
    get new_initiative_path
    assert_no_difference 'Initiative.count' do
      post initiatives_path, params: { initiative: {name: '', description:'', area_id:'', location:''}}
    end
    assert_template 'initiatives/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'valid new initiative information' do
    get new_initiative_path
    assert_difference 'Initiative.count', 1 do
      post initiatives_path, params: { initiative: {name: Faker::Name.name, description: Faker::Lorem.sentence, area_id:Area.last.id, location:Faker::StarWars.planet}}
    end
    follow_redirect!
    assert_template 'initiatives/show'
  end

  # Ensure a volunteer can't access initiatives other than the ones they run
  test "access other initiative" do
    log_in_as(@volunteer)
    get initiative_path(@initiative)
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
