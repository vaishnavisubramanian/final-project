# frozen_string_literal: true

class CreatePaymentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_details do |t|
      t.integer :card_number
      t.string :card_holder_name
      t.integer :month
      t.integer :year
      t.integer :cvv
      t.references :booking_details, null: false, foreign_key: true

      t.timestamps
    end
  end
end
