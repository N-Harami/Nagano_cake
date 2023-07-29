class Order < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum address_method: { "ご自身の住所": 0, "登録済み住所": 1, "新しいお届け先": 2 } 
  enum order_status: {"入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済み":4}
  
end
