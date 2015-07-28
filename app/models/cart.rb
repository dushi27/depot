class Cart < ActiveRecord::Base
  has_many :line_items,  dependent: :destroy
  
  def list_products
    @list = self.line_items.eager_load(:product).select("products.title , line_items.quantity, products.price, line_items.id")
  end
  
  def add_product(product_id)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(:product_id => product_id)
      line_items << current_item
    end
    current_item
  end
  
  def total_price 
    line_items.to_a.sum { |item| item.total_price }
  end  
  
  def total_items 
    line_items.sum(:quantity)
  end
  
end
