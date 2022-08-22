class AddFieldNameFromTableName < ActiveRecord::Migration[6.1]
  def change
    add_column :payment_details, :card_number, :integer
  end
end
