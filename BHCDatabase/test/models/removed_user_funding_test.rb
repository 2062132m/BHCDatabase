require 'test_helper'

# RemovedUserFundingTest is the generic model test for a removed user funder.
class RemovedUserFundingTest < ActiveSupport::TestCase
  def setup
    @removed_user_funder = removed_user_fundings(:one)
  end

  test 'should be valid' do
    assert @removed_user_funder.valid?
  end

  test 'should have a user' do
    @removed_user_funder.user = nil
    assert_not @removed_user_funder.valid?
  end

  test 'should have a funder' do
    @removed_user_funder.funder = nil
    assert_not @removed_user_funder.valid?
  end

  test 'datetime should accept valid dates' do
    valid_date = '01/01/2012 23:59:59'
    @removed_user_funder.date_given = valid_date
    assert @removed_user_funder.date_given.to_datetime.is_a?(DateTime)
  end

  test 'datetime should reject invalid dates' do
    invalid_date = '12/13/2016'
    @removed_user_funder.date_given = invalid_date
    assert_raises(Exception) { @removed_user_funder.date_given.to_datetime }
  end

  test 'should accept duplicate entries' do
    @duplicate_removed_funder = @removed_user_funder.dup
    assert @duplicate_removed_funder.valid?
    assert_difference 'RemovedUserFunding.count', 1 do
      @duplicate_removed_funder.save
    end
  end
end
