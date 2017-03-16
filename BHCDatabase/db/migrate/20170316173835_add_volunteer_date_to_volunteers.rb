class AddVolunteerDateToVolunteers < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteers, :volunteer_date, :date
  end
end
