class ChangeColumnsAddNotnullOnOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :postcode, false
    change_column_null :orders, :address, false
    change_column_null :orders, :name, false
    
    
  end
end
