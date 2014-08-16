class OrdersController < ApplicationController            
  skip_before_filter :authorize, only: [:new, :create]
  
  def index
    @orders = Order.paginate(page: params[:page], per_page: 30)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @cart = current_cart
    
    if @cart.line_items.empty?
      redirect_to store_url, :notice => "Your cart is empty"
      return
    end
    @order = Order.new   
    
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(order_params)
    @order.add_line_items_from_cart(current_cart)
       
 
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to(store_url, notice: 'Thank you for your order.')
        Notifier.order_received(@order).deliver
      else
        render action: "new"
      end

  end

  def update
    @order = Order.find(params[:id])
   
      if @order.update_attributes(params[:order])
       redirect_to(@order, notice:'Order was successfully updated.')        
      else
        render action: "edit"        
      end
    
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to(orders_url)
  end
  
  private
  def order_params
    params.require(:order).permit(:name,:address, :email, :pay_type)
  end
  
end