require 'test_helper'

class MedicalConditionEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
    @condition_one = medical_conditions(:one)
    @condition_two = medical_conditions(:two)
    log_in_as @user
  end

  # Ensure medical condition editing should fail with invalid parameters
  test 'unsuccessful edit' do
    get edit_medical_condition_url(@condition_one)
    assert_template 'medical_conditions/edit'
    # Name cannot be blank
    patch medical_condition_url(@condition_one), params: { medical_condition: { name: '',
                                                                                description: 'example description' } }
    # Assert error message divs are displayed
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    # Assert we are redirected back to the edit page
    assert_template 'medical_conditions/edit'
  end

  # Ensure medical condition editing is successful with valid parameters
  test 'successful edit' do
    get edit_medical_condition_url(@condition_two)
    assert_template 'medical_conditions/edit'
    description = 'example description'
    patch medical_condition_url(@condition_two), params: {medical_condition: {name: @condition_two.name,
                                                                              description: description}}
    assert_not flash.empty?
    assert_redirected_to @condition_two
    @condition_two.reload
    # Assert description has been changed correctly
    assert_equal description, @condition_two.description
  end
end
