require 'test_helper'

class MedicalConditionNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
    log_in_as(@user)
  end

  test 'invalid new medical condition' do
    get new_medical_condition_url
    assert_no_difference 'MedicalCondition.count' do
      post medical_conditions_path, params: {medical_condition: {name: '',
                                                                 description: ''}}
    end
    assert_template 'medical_conditions/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'valid new medical_condition' do
    get new_medical_condition_url
    assert_difference 'MedicalCondition.count', 1 do
      post medical_conditions_path, params: {medical_condition: {name: Faker::Name.name,
                                                                 description: Faker::Lorem.sentence}}
    end
    follow_redirect!
    assert_template 'medical_conditions/show'
  end

end
