class AddSeatsToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :seats, :string
  end
end
