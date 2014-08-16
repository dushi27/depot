class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.create(product_params)   
      if @product.save
        redirect_to(@product, :notice => 'Product was successfully created.')        
      else
        render :action => "new"
      #  format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
  end

  def update
    @product = Product.find(params[:id])
   
      if @product.update_attributes(params[:product])
        redirect_to(@product, :notice => 'Product was successfully updated.')
       # format.xml  { head :ok }
      else
        render :action => "edit"
       # format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end

  end

 def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to(products_url) 
  end
  
  def who_bought
    @product = Product.find(params[:id])   
      format.atom
     # format.xml { render xml: @product }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end
end
