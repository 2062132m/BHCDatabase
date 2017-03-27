require 'test_helper'

# QuestionTest is the generic model test for a question.
class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = questions(:one)
  end

  test 'should be valid' do
    assert @question.valid?
  end

  test 'question should be present' do
    @question.question = ''
    assert_not @question.valid?
  end

  test "question shouldn't be too long" do
    @question.question = 'a' * 65_537
    assert_not @question.valid?
  end

  test 'visible should be present' do
    @question.visible = nil
    assert_not @question.valid?
  end

  test 'question_type should be present' do
    @question.question_type = nil
    assert_not @question.valid?
  end

  test 'question should be unique' do
    @duplicate_question = @question.dup
    assert @duplicate_question.question == @question.question
    assert_no_difference 'Question.count' do
      @duplicate_question.save
    end
  end
end
