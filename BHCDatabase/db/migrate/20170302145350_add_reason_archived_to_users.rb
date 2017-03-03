class AddReasonArchivedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reason_archived, :string
  end
end
