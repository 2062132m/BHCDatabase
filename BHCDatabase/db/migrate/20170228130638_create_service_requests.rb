class CreateServiceRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :service_requests do |t|
      t.references :user, foreign_key: true
      t.text :request

      t.timestamps
    end
  end
end
