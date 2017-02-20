require 'test_helper'

class QuestionsNewTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:david)
    log_in_as(@user)
  end

  test 'invalid new question information' do
    get new_question_url
    assert_no_difference 'Question.count' do
      post questions_path, params: {question: {question: '', visible: -1, sort: -1, multiple_choice: -1}}
    end
    assert_template 'questions/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'valid new question information' do
    get new_question_url
    assert_difference 'Question.count', 1 do
      post questions_path, params: {question: {id: 3, question: Faker::Lorem.sentence, visible: true, sort: 3, multiple_choice: true}}
    end
    follow_redirect!
    assert_template 'questions/show'
  end
end
