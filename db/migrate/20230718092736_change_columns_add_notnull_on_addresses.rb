class ChangeColumnsAddNotnullOnAddresses < ActiveRecord::Migration[6.1]
  def change
    
    change_column_null :addresses, :address, false
    change_column_null :addresses, :name, false
  end
end
