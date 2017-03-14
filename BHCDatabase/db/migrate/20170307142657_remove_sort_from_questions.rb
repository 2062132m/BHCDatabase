class RemoveSortFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :sort, :integer
  end
end
