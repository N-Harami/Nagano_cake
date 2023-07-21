class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :tax_excluded_price
      t.boolean :is_sale_status, default: true, null: false


      t.timestamps
    end
  end
end
