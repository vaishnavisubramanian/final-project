class CreateBusShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :bus_shifts do |t|
      t.integer :shift, limit: 1
      t.integer :fare
      t.time :departure_time
      t.time :arrival_time
      t.string :conductor_name
      t.integer :conductor_phone_number, limit: 5
      t.references :bus, null: false, foreign_key: true
      t.references :from_location, foreign_key: { to_table: 'places' }
      t.references :to_location, foreign_key: { to_table: 'places' }

      t.timestamps
    end
  end
end
