class ChangeColumnsAddNotnullOnCartItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :cart_items, :quantity, false
  end
end
