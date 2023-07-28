class Public::OrderDetailsController < ApplicationController
  
  
   belongs_to :order
  belongs_to :item

end
