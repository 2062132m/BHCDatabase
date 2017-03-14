class RemoveMultipleChoiceFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :multiple_choice, :boolean
  end
end
