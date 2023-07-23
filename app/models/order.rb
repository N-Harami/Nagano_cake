class Order < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  
  enum payment_method: { credit_card: 0, transfar: 1 }
end
