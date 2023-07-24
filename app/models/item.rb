class Item < ApplicationRecord
  has_one_attached :image

  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  has_many :customers, through: :cart_items
  has_many :cart_items, dependent: :destroy



  belongs_to :genre, optional: true
  
  with_options presence: true do
    validates :name
    validates :description
    validates :tax_excluded_price
    validates :image
  end
  
  validates :is_sale_status, inclusion: { in: [true,false] }
  
  def add_tax_tax_excluded_price
      (self.tax_excluded_price * 1.10).round
  end

end
