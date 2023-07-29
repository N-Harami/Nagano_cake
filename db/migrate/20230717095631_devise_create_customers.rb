# frozen_string_literal: true

class DeviseCreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "last_name", null: false
      t.string "first_name", null: false
      t.string "last_name_kana", null: false
      t.string "first_name_kana", null: false
      t.string "postcode", null: false
      t.text "address", null: false
      t.string "phone_number", null: false
      t.boolean "is_quit_status", default: false, null: false
      t.index ["email"], name: "index_customers_on_email", unique: true
      t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
   end
  end
end
