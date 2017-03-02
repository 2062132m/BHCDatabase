require 'test_helper'

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
    @funder.email = 'a' * 266
    assert_not @funder.valid?
  end

  test "telephone shouldn't be too long" do
    @funder.telephone = '0' * 17
    assert_not @funder.valid?
  end

  test "address shouldn't be too long" do
    @funder.address = 'a' * 51
    assert_not @funder.valid?
  end

  test "description shouldn't be too long" do
    @funder.description = 'a' * 266
    assert_not @funder.valid?
  end

end
