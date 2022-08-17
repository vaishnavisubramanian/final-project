# frozen_string_literal: true

class CreateBookingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_details do |t|
      t.integer :seats_wanted
      t.string :main_passenger_name
      t.integer :age
      t.integer :phone_number, limit: 5
      t.references :bus, null: false, foreign_key: true
      t.references :bus_shift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
