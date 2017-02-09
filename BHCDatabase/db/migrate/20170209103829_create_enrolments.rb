class CreateEnrolments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrolments do |t|
      t.references :user, foreign_key: true
      t.references :initiative, foreign_key: true

      t.timestamps
    end
  end
end
