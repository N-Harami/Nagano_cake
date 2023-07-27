class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status:{impossible:0, before:1, doing:2, completion:3}
                        #{着手不可:0, 製作待ち:1, 製作中:2, 製作完了:3}
end
