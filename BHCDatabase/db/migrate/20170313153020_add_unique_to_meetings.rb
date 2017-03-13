class AddUniqueToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_index :meetings, [:initiative_id, :datetime], unique: true
  end
end
