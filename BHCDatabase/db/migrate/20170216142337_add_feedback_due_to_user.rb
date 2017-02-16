class AddFeedbackDueToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :feedback_due, :date
  end
end
