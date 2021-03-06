class LineItemsController < ApplicationController
  skip_before_filter :authorize, only: [:create, :destroy, :index]

  def index
    @line_items = LineItem.all    
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def new
    @line_item = LineItem.new
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

 def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id) #adds  products with the same product_id and display as a total

   respond_to do |format|
     if @line_item.save
       format.html { redirect_to(store_url)  }
       format.js   { @current_item = @line_item }        
     else
       redirect_to store_url, notice: 'An error occured'       
     end
   end
 end

  def update
    @cart = current_cart
    @line_items = @cart.line_items
    
    if @line_item.update_attributes(params[:line_item])
      redirect_to(@line_item, notice: 'Line item was successfully updated.')        
    else
      render action: "edit"        
    end 
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    
    flash[:success] =  'Item was removed from the cart'
    @cart = Cart.find(params[:cart_id])   
    
    if @cart.line_items.empty?
      redirect_to store_url
    else
      redirect_to cart_path((params[:cart_id]))
    end
  end

  
  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end