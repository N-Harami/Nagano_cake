class AddAddressToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :address, :text, null: false
  end
end
