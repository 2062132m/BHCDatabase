require 'test_helper'

# FunderTest contains the model tests for a Funder
class FunderTest < ActiveSupport::TestCase

  def setup
    @funder = Funder.create(name: 'Example Funder',
                            address: 'Example Address',
                            url: 'https://www.example.com',
                            description: 'Example Description',
                            email: 'example@example.com',
                            telephone: '0123456789')
  end

  test 'should be valid' do
    assert @funder.valid?
  end

  test 'name should be present' do
    @funder.name = ''
    assert_not @funder.valid?
  end

  test "email shouldn't be too long" do
    @funder.email = 'a' * 256
    assert_not @funder.valid?
  end

  test "telephone shouldn't be too long" do
    @funder.telephone = '0' * 256
    assert_not @funder.valid?
  end

  test "address shouldn't be too long" do
    @funder.address = 'a' * 256
    assert_not @funder.valid?
  end

  test "description shouldn't be too long" do
    @funder.description = 'a' * 65_537
    assert_not @funder.valid?
  end

  test 'index on name and email' do
    @duplicate_funder = @funder.dup
    assert_not @duplicate_funder.valid?
    assert @duplicate_funder.name == @funder.name
    assert @duplicate_funder.email == @funder.email
    assert_no_difference 'Funder.count' do
      @duplicate_funder.save
    end
  end

end
