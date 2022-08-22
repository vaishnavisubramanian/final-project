# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_22_043732) do

  create_table "booking_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "seats_wanted"
    t.string "main_passenger_name"
    t.integer "age"
    t.bigint "phone_number"
    t.bigint "bus_id", null: false
    t.bigint "bus_shift_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["bus_id"], name: "index_booking_details_on_bus_id"
    t.index ["bus_shift_id"], name: "index_booking_details_on_bus_shift_id"
    t.index ["user_id"], name: "index_booking_details_on_user_id"
  end

  create_table "bus_shifts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "shift", limit: 1
    t.integer "fare"
    t.time "departure_time"
    t.time "arrival_time"
    t.string "conductor_name"
    t.bigint "conductor_phone_number"
    t.bigint "bus_id", null: false
    t.bigint "from_location_id"
    t.bigint "to_location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bus_id"], name: "index_bus_shifts_on_bus_id"
    t.index ["from_location_id"], name: "index_bus_shifts_on_from_location_id"
    t.index ["to_location_id"], name: "index_bus_shifts_on_to_location_id"
  end

  create_table "buses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "bus_number"
    t.string "travel_name"
    t.integer "number_of_seats"
    t.boolean "bus_type"
    t.boolean "seat_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "card_holder_name"
    t.integer "month"
    t.integer "year"
    t.integer "cvv"
    t.bigint "booking_detail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "card_number"
    t.index ["booking_detail_id"], name: "index_payment_details_on_booking_detail_id"
  end

  create_table "places", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "customer"
  end

  add_foreign_key "booking_details", "bus_shifts"
  add_foreign_key "booking_details", "buses"
  add_foreign_key "bus_shifts", "buses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "bus_shifts", "places", column: "from_location_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "bus_shifts", "places", column: "to_location_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "payment_details", "booking_details"
end
