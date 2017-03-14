class AddDateEnrolledToUnenrolments < ActiveRecord::Migration[5.0]
  def change
    add_column :unenrolments, :date_enrolled, :datetime
  end
end
