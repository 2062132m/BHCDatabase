class ChangeColumn < ActiveRecord::Migration[5.0]
  def self.up
    change_column :users, :privilege, :boolean
  end

  def self.down
    change_column :users, :privilege, :integer
  end
end
