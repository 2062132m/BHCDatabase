class AddInitiativeToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_reference :meetings, :initiative, foreign_key: true
  end
end
