class CartItem < ApplicationRecord
belongs_to :customer
belongs_to :item

validates :quantity, presence: true

def subtotal
    (item.tax_excluded_price * 1.1).round * quantity
end

end
