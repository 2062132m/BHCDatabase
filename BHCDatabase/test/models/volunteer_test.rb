require 'test_helper'

# VolunteerTest is the model test for a generic volunteer model. Volunteer
#   holding the special attributes that a volunteer user should have.
class VolunteerTest < ActiveSupport::TestCase
  def setup
    @volunteer = volunteers(:one)
  end

  test 'should be valid' do
    assert @volunteer.valid?
  end

  test 'life_experiences should be present' do
    @volunteer.life_experiences = nil
    assert_not @volunteer.valid?
  end

  test 'life_experiences should not be too long' do
    @volunteer.life_experiences = 'a' * 65_537
    assert_not @volunteer.valid?
  end

  test 'skills should be present' do
    @volunteer.skills = nil
    assert_not @volunteer.valid?
  end

  test 'skills should not be too long' do
    @volunteer.skills = 'a' * 65_537
    assert_not @volunteer.valid?
  end

  test 'aspirations should be present' do
    @volunteer.aspirations = nil
    assert_not @volunteer.valid?
  end

  test 'aspirations should not be too long' do
    @volunteer.aspirations = 'a' * 65_537
    assert_not @volunteer.valid?
  end

  test 'num_children should be present' do
    @volunteer.num_children = nil
    assert_not @volunteer.valid?
  end

  test 'num_children must be valid number' do
    @volunteer.num_children = -1
    assert_not @volunteer.valid?
  end

  test 'childcare_help should be present' do
    @volunteer.childcare_help = nil
    assert_not @volunteer.valid?
  end

  test 'carer should be present' do
    @volunteer.carer = nil
    assert_not @volunteer.valid?
  end

  test 'carer_costs should be present' do
    @volunteer.carer = nil
    assert_not @volunteer.valid?
  end

  test 'employment should be present' do
    @volunteer.employment = nil
    assert_not @volunteer.valid?
  end

  test 'employment should not be too long' do
    @volunteer.employment = 'a' * 256
    assert_not @volunteer.valid?
  end

  test 'registered_disabled should be present' do
    @volunteer.registered_disabled = nil
    assert_not @volunteer.valid?
  end

  test 'induction_completed should be present' do
    @volunteer.induction_completed = nil
    assert_not @volunteer.valid?
  end
end
