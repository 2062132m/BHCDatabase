class CreateFunders < ActiveRecord::Migration[5.0]
  def change
    create_table :funders do |t|
      t.string :name
      t.string :address
      t.string :url
      t.text :description
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
