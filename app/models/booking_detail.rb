# frozen_string_literal: true

class BookingDetail < ApplicationRecord
  belongs_to :bus
  belongs_to :bus_shift
end
