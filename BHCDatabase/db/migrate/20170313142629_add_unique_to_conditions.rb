class AddUniqueToConditions < ActiveRecord::Migration[5.0]
  def change
    add_index :conditions, [:medical_condition_id, :user_id], unique: true
  end
end
