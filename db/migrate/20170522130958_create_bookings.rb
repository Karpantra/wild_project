class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.references :user, foreign_key: true
      t.references :asset, foreign_key: true

      t.timestamps
    end
  end
end
