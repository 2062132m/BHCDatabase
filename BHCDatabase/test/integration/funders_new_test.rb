require 'test_helper'

class FundersNewTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    log_in_as(@user)
  end

  # Ensure funder creation should fail with invalid parameters
  test 'invalid new funder' do
    get new_funder_url
    assert_no_difference 'Funder.count' do
      # Name cannot be blank
      post funders_path, params: { funder: { name: '',
                                             description: 'example description',
                                             email: 'example@example.com',
                                             telephone: '0123456789',
                                             url: 'https://www.example.com',
                                             address: 'example address' } }
    end
    assert_template 'funders/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  # Ensure funder creation is successful with valid parameters
  test 'valid new funder' do
    get new_funder_url
    assert_difference 'Funder.count', 1 do
      post funders_path, params: { funder: { name: 'example name',
                                             description: 'example description',
                                             email: 'example@example.com',
                                             telephone: '0123456789',
                                             url: 'https://www.example.com',
                                             address: 'example address' } }
    end
    follow_redirect!
    assert_template 'funders/show'
  end
end
