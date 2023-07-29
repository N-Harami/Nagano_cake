class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :postcode
      t.text :address
      t.string :name
      t.integer :customer_id, null: false

      t.timestamps
    end
  end
end
