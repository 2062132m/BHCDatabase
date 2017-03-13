class AddUniqueToEnrolments < ActiveRecord::Migration[5.0]
  def change
    add_index :enrolments, [:user_id, :initiative_id], unique: true
  end
end
