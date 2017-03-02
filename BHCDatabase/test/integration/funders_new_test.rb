require 'test_helper'

class FundersNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
    log_in_as(@user)
  end

  test 'invalid new funder' do
    get new_funder_url
    assert_no_difference 'Funder.count' do
      post funders_path, params: {funder: {name: '',
                                           description: Faker::Lorem.sentence,
                                           email: Faker::Internet.email,
                                           telephone: Faker::PhoneNumber.phone_number,
                                           url: Faker::Internet.url,
                                           address: Faker::Address.full_address}}
    end
    assert_template 'funders/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'valid new funder' do
    get new_funder_url
    assert_difference 'Funder.count', 1 do
      post funders_path, params: {funder: {name: Faker::Company.name,
                                           description: Faker::Lorem.sentence,
                                           email: Faker::Internet.email,
                                           telephone: Faker::PhoneNumber.phone_number,
                                           url: Faker::Internet.url,
                                           address: Faker::Address.full_address}}
    end
    follow_redirect!
    assert_template 'funders/show'
  end
end
