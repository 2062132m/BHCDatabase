class AddReasonArchivedToInitiatives < ActiveRecord::Migration[5.0]
  def change
    add_column :initiatives, :reason_archived, :string
  end
end
