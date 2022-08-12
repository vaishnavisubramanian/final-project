# frozen_string_literal: true

class BusShift < ApplicationRecord
  validates :shift, presence: true
  validates :fare, presence: true
  validates :departure_time, presence: true
  validates :arrival_time, presence: true
  validates :conductor_name, presence: true
  validates :conductor_phone_number, presence: true
  validates :from_location_id, presence: true
  validates :to_location_id, presence: true
end
