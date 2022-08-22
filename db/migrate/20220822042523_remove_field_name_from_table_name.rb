class RemoveFieldNameFromTableName < ActiveRecord::Migration[6.1]
  def change
    remove_column :payment_details, :card_number, :integer
  end
end
