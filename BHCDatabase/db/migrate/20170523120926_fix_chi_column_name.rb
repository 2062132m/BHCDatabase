class FixChiColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :CHI_Number, :chi
  end
end
