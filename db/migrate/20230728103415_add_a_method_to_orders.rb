class AddAMethodToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :a_method, :integer
  end
end
