class CreateRemovedInitiativeFundings < ActiveRecord::Migration[5.0]
  def change
    create_table :removed_initiative_fundings do |t|
      t.references :funder, foreign_key: true
      t.references :initiative, foreign_key: true

      t.timestamps
    end
  end
end
