class CreatePickupRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :pickup_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :company_name
      t.string :address
      t.text :items
      t.string :desired_period
      t.string :required_documents
      t.text :notes
      t.integer :status, null: false, default: 0
      t.datetime :scheduled_at
      t.string :driver_name

      t.timestamps
    end
  end
end
