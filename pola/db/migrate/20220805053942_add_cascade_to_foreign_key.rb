# frozen_string_literal: true

class AddCascadeToForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :bus_shifts, :buses
    add_foreign_key :bus_shifts, :buses, on_delete: :cascade, on_update: :cascade
  end
end
