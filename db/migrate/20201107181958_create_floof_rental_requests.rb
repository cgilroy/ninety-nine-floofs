class CreateFloofRentalRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :floof_rental_requests do |t|
      t.integer :floof_id, null:false
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.string :status, null:false, default:'PENDING'

      t.timestamps
    end
    add_index :floof_rental_requests, :floof_id
  end
end
