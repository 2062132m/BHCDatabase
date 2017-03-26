require 'test_helper'

# UserFunderTest is the model test for a generic user funder.
class UserFunderTest < ActiveSupport::TestCase
  def setup
    @user_funder = user_funders(:two)
  end

  test 'should be valid' do
    assert @user_funder.valid?
  end

  test 'funder should be present' do
    @user_funder.funder = nil
    assert_not @user_funder.valid?
  end

  test 'user should be present' do
    @user_funder.user = nil
    assert_not @user_funder.valid?
  end

  # Tests that a funder can't fund a user twice at the same time.
  test 'index on user and funder' do
    @duplicate_funder = @user_funder.dup
    assert_not @duplicate_funder.valid?
    assert_no_difference 'UserFunder.count' do
      @duplicate_funder.save
    end
  end
end
