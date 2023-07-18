class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :payment_methods
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :shippingFee
      t.integer :billingAmount
      t.integer :orderStatus

      t.timestamps
    end
  end
end
