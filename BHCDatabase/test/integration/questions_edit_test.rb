require 'test_helper'

class QuestionsEditTest < ActionDispatch::IntegrationTest
  # def setup
  #   @user = users(:admin)
  #   @question_one = questions(:one)
  #   @question_two = questions(:two)
  #   log_in_as @user
  # end
  #
  # test 'unsuccessful edit' do
  #   get edit_question_url(@question_one)
  #   assert_template 'questions/edit'
  #   patch question_path(@question_one), params: {question: {question: '', visible: -1, multiple_choice: -1}}
  #
  #   assert_select 'div#error_explanation'
  #   assert_select 'div.field_with_errors'
  #
  #   assert_template 'questions/edit'
  # end
  #
  # test 'successful edit' do
  #   get edit_question_url(@question_two)
  #   assert_template 'questions/edit'
  #   question = Faker::Lorem.sentence
  #   patch question_path(@question_two), params: {question: {question: question, visible: true, multiple_choice: true}}
  #
  #   assert_not flash.empty?
  #   assert_redirected_to @question_two
  #   @question_two.reload
  #   assert_equal question, @question_two.question
  # end
end
