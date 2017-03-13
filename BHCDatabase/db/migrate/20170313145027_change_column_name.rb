class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :unassigned_conditions, :date_unassigned, :date_assigned
  end
end
