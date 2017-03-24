require 'test_helper'

class FundersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @funder_one = funders(:one)
    @funder_two = funders(:two)
    log_in_as @user
  end

  test 'unsuccessul funder edit' do
    get edit_funder_url(@funder_one)
    assert_template 'funders/edit'
    patch funder_url(@funder_one), params: { funder: { name: '',
                                                       description: 'example description',
                                                       email: 'example@example.com',
                                                       telephone: '0123456789',
                                                       url: 'https://www.example.com',
                                                       address: 'example address' } }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_template 'funders/edit'
  end

  test 'successful funder edit' do
    get edit_funder_url(@funder_two)
    assert_template 'funders/edit'
    description = 'example description'
    patch funder_url(@funder_two), params: { funder: { name: @funder_two.name,
                                                       description: description,
                                                       email: @funder_two.email,
                                                       telephone: @funder_two.telephone,
                                                       url: @funder_two.url,
                                                       address: @funder_two.address } }
    assert_not flash.empty?
    assert_redirected_to @funder_two
    @funder_two.reload
    assert_equal description, @funder_two.description
  end
end
