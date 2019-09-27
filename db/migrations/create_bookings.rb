class CreateBooking < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |table|
      table.references :users, foreign_key: true
      table.references :spaces, foreign_key: true
      table.boolean :booked, :default => false
    end
  end
end
