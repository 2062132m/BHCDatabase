require 'test_helper'

class FeedbackNewTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    @question_one = questions(:one)
    @question_two = questions(:two)
    @service_user2 = users(:service_user2)
    @feedback2 = feedbacks(:two)
    @feedback = feedbacks(:one)
    log_in_as(@admin)
  end

  # Ensure feedback creation is successful with valid parameters(/answers)
  test 'valid new feedback test' do
    get new_feedback_path, params: { user_id: @service_user.id }
    answers = { '0' => { question_id: @question_one.id, response: 'example' },
                '1' => { question_id: @question_two.id, response: 'example' } }
    assert_difference 'Feedback.count', 1 do
      post feedbacks_path, params: { feedback: { user_id: @service_user.id,
                                                 answers_attributes: answers } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'feedbacks/show'
  end

  # Ensure you can only view your own feedback
  test 'access other feedback show' do
    log_in_as(@service_user)
    # Feedback2 does not belong to service_user
    get feedback_path(@feedback2)
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  # Ensure you can only get new for your own feedback
  test 'access other feedback new' do
    log_in_as @service_user
    # Pass id of another user in params
    get new_feedback_url, params: { user_id: @service_user2.id }
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end

  # Ensure you can only call create for your own feedback
  test 'access other feedback create' do
    log_in_as @service_user
    get new_feedback_path, params: { user_id: @service_user.id }
    answers = { '0' => { question_id: @question_one.id, response: 'example' },
                '1' => { question_id: @question_two.id, response: 'example' } }
    assert_difference 'Feedback.count', 0 do
      # Try to submit the feedback for a different user
      post feedbacks_path, params: { feedback: { user_id: @service_user2.id,
                                                 answers_attributes: answers } }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
