require 'test_helper'

# FeedbackTest is the model tests for our Feedback model
class FeedbackTest < ActiveSupport::TestCase
  def setup
    @feedback = feedbacks(:one)
  end

  test 'should be valid' do
    assert @feedback.valid?
  end

  test 'should have a user' do
    @feedback.user = nil
    assert @feedback
  end
end
