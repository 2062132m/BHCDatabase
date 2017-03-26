require 'test_helper'

# RemovedInitiativeFundingTest is the generic model test for a removed
#   initiative funder.
class RemovedInitiativeFundingTest < ActiveSupport::TestCase
  def setup
    @removed_init_funder = removed_initiative_fundings(:one)
  end

  test 'should be valid' do
    assert @removed_init_funder.valid?
  end

  test 'datetime should accept valid dates' do
    valid_date = '01/01/2012 23:59:59'
    @removed_init_funder.date_given = valid_date
    assert @removed_init_funder.date_given.to_datetime.is_a?(DateTime)
  end

  test 'datetime should reject invalid dates' do
    invalid_date = '12/13/2016'
    @removed_init_funder.date_given = invalid_date
    assert_raises(Exception) { @removed_init_funder.date_given.to_datetime }
  end

  test 'should accept duplicate entries' do
    @duplicate_removed_funder = @removed_init_funder.dup
    assert @duplicate_removed_funder.valid?
    assert_difference 'RemovedInitiativeFunding.count', 1 do
      @duplicate_removed_funder.save
    end
  end
end