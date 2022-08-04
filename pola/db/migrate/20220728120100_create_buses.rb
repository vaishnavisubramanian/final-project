class CreateBuses < ActiveRecord::Migration[6.1]
  def change
    create_table :buses do |t|
      t.string :bus_number
      t.string :travel_name
      t.integer :number_of_seats
      t.boolean :bus_type
      t.boolean :seat_type

      t.timestamps
    end
  end
end
