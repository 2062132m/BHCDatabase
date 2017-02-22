require 'test_helper'

class MedicalConditionEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
    @condition_one = medical_conditions(:one)
    @condition_two = medical_conditions(:two)
    log_in_as @user
  end

  test 'unsuccessful edit' do
    get edit_medical_condition_url(@condition_one)
    assert_template 'medical_conditions/edit'
    patch medical_condition_url(@condition_one), params: {medical_condition: {name: '',
                                                                              description: Faker::Lorem.sentence}}
    assert_template 'medical_conditions/edit'
  end

  test 'successful edit' do
    get edit_medical_condition_url(@condition_two)
    assert_template 'medical_conditions/edit'
    description = Faker::Lorem.sentence
    patch medical_condition_url(@condition_two), params: {medical_condition: {name: @condition_two.name,
                                                                              description: description}}
    assert_not flash.empty?
    assert_redirected_to @condition_two
    @condition_two.reload
    assert_equal description, @condition_two.description
  end


end
