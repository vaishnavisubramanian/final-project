# frozen_string_literal: true

class Bus < ApplicationRecord
  has_many :shifts
  validates :bus_number, uniqueness: true, presence: true
  validates :travel_name, presence: true
  validates :number_of_seats, presence: true
end
