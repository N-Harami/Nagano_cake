class AddIsQuitStatusToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_quit_status, :boolean, default: false, null: false
  end
end
