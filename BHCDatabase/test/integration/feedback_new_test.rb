require 'test_helper'

class FeedbackNewTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @service_user = users(:service_user)
    @service_user_two = users(:service_user2)
    log_in_as(@admin)
  end

  test "valid new feedback test" do
    get new_feedback_path, params: { user_id: @service_user.id }
    assert_difference 'Feedback.count', 1 do
      post feedbacks_path, params: { feedback: { user_id: @service_user.id,
                                     answers_attributes: {
                                       '0': { question_id: 1, response: "example" },
                                       '1': { question_id: 2, response: "example" },
                                       }
                                     }
                                   }
    end
    follow_redirect!
    assert_not flash.empty?
    assert_template 'feedbacks/show'
  end

  test "access other feedback" do
    log_in_as(@service_user)
    get new_feedback_path, params: { user_id: @service_user_two.id }
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
  end
end
