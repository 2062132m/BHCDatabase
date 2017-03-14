class AddUniqueToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_index :answers, [:feedback_id, :question_id], unique: true
  end
end
