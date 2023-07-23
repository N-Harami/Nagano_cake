class AddPostcodeToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :postcode, :string, null: false
  end
end
