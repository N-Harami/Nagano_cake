class Item < ApplicationRecord
  has_one_attached :image

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
