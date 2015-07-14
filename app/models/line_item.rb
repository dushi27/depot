class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order
  
  def total_price
    0 and return if product.nil?
    product.price * quantity
  end  
end
