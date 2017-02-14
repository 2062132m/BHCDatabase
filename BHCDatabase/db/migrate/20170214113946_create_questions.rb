class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question
      t.boolean :visible
      t.integer :sort

      t.timestamps
    end
    add_index :questions, :sort, unique: true
  end
end
