class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.integer :tax_excluded_price, null: false
      t.boolean :is_sale_status, null: false, default: true
      t.timestamps
    end
  end
end
