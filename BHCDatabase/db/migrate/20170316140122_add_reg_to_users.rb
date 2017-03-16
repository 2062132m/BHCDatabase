class AddRegToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :aims, :integer, :default => 0
    add_column :users, :aims_other, :string
    add_column :users, :prevent_attending, :string
    add_column :users, :reg_date, :date
  end
end
