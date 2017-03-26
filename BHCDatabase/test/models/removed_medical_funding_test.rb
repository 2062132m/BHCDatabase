require 'test_helper'

# RemovedMedicalFundingTest is the generic model test for a removed medical funder.
class RemovedMedicalFundingTest < ActiveSupport::TestCase
  def setup
    @removed_med_funder = removed_medical_fundings(:one)
  end

  test 'should be valid' do
    assert @removed_med_funder.valid?
  end

  test 'should have a medical condition' do
    @removed_med_funder.medical_condition = nil
    assert_not @removed_med_funder.valid?
  end

  test 'should have a funder' do
    @removed_med_funder.funder = nil
    assert_not @removed_med_funder.valid?
  end

  test 'datetime should accept valid dates' do
    valid_date = '01/01/2012 23:59:59'
    @removed_med_funder.date_given = valid_date
    assert @removed_med_funder.date_given.to_datetime.is_a?(DateTime)
  end

  test 'datetime should reject invalid dates' do
    invalid_date = '12/13/2016'
    @removed_med_funder.date_given = invalid_date
    assert_raises(Exception) { @removed_med_funder.date_given.to_datetime }
  end

  test 'should accept duplicate entries' do
    @duplicate_removed_funder = @removed_med_funder.dup
    assert @duplicate_removed_funder.valid?
    assert_difference 'RemovedMedicalFunding.count', 1 do
      @duplicate_removed_funder.save
    end
  end
end
