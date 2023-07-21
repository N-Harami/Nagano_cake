class AddLastNameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_name, :string, null: false
  end
end
