class CartsController < ApplicationController                 
  skip_before_filter :authorize, only: [:create, :update, :destroy]

  def index
    @carts = Cart.all

    respond_to do |format|
      format.html 
      format.xml  { render xml: @carts }
    end
  end

  def show
    begin
      @cart = Cart.find(params[:cart_id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_url, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html 
        format.xml  { render xml: @cart }
      end
    end
  end

  def new
    @cart = Cart.new

    respond_to do |format|
      format.html 
      format.xml  { render xml: @cart }
    end
  end

  def edit
    @cart = current_cart
  end

  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to(@cart, notice: 'Cart was successfully created.') }
        format.xml  { render xml: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.xml  { render xml: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
  @cart = Cart.find(:id)
      
   respond_to do |format|
     if @cart.update_attributes(params[cart])
       format.html { redirect_to(@cart, notice: 'Cart was successfully updated.') }
       format.xml  { head :ok }
     else
       format.html { render action: "edit" }
       format.xml  { render xml: @cart.errors, status: :unprocessable_entity }
     end
    end
 end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil #remove the cart from the session 

    respond_to do |format|
      format.html { redirect_to(store_url, notice: 'Your cart is currently empty' ) }
      format.xml  { head :ok }
    end
  end




end