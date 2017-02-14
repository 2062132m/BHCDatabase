class AddMultipleChoiceToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :multiple_choice, :boolean
  end
end
