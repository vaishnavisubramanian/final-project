class Bus < ApplicationRecord
  validates :bus_number, uniqueness: true
end
