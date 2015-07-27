class StoreController < ApplicationController      
  skip_before_filter :authorize
  
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.paginate(page: params[:page], per_page: 8)
      @cart = current_cart
    end
  end
  
  def search
    @products = Product.search(params[:query]).paginate(page: params[:page], per_page: 8)
    render 'index'
  end
end