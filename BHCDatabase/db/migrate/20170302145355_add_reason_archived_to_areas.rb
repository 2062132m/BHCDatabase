class AddReasonArchivedToAreas < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :reason_archived, :string
  end
end
