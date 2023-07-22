class AddPhoneNumberToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :phone_number, :string, null: false
  end
end
