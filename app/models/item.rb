class Item < ApplicationRecord
  has_one_attached :image
  has_many :order_details, dependent: :destroy
  has_many :orders, through: order_details
  has_many :customers, through: cart_items
  has_many :cart_items, dependent: :destroy

end
