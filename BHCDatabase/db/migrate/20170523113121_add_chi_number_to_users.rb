class AddChiNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :CHI_Number, :string
    add_index :users, :CHI_Number, unique: true
  end
end
