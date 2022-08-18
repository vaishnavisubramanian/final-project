# frozen_string_literal: true

class PaymentDetail < ApplicationRecord
  belongs_to :booking_details
end
