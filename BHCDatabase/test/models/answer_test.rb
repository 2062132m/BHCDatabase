require 'test_helper'

# AnswerTest is the model test for an answer
class AnswerTest < ActiveSupport::TestCase
  def setup
    @answer = answers(:one)
  end

  test 'should be valid' do
    assert @answer.valid?
  end

  test 'response should be present' do
    @answer.response = ''
    assert_not @answer.valid?
  end

  test 'response should not be too long' do
    @answer.response = 'a' * 65_537
    assert_not @answer.valid?
  end

  test 'should have a question' do
    @answer.question = nil
    assert_not @answer.valid?
  end

  test "doesn't need a feedback" do
    @answer.feedback = nil
    assert @answer.valid?
  end

  test 'index on feedback and question' do
    @duplicate_answer = @answer.dup
    @duplicate_answer.response = @duplicate_answer.response.upcase
    assert_not @duplicate_answer.valid?
    assert_no_difference 'Answer.count' do
      @duplicate_answer.save
    end
  end
end
