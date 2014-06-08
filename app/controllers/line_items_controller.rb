class LineItemsController < ApplicationController
  skip_before_filter :authorize, only: :create

  def index
    @line_items = LineItem.all    
    respond_to do |format|
      format.html
      format.xml  { render xml: @line_items }
    end
  end

  def show
    @line_item = LineItem.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @line_item }
    end
  end

  def new
    @line_item = LineItem.new
    
    respond_to do |format|
      format.html
      format.xml  { render xml: @line_item }
    end
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

 def create
     @cart = find_or_create_cart
     product = Product.find(params[:product_id])
     @line_item = @cart.line_items.build(:product => product)

     respond_to do |format|
       if @line_item.save
         format.html { redirect_to(store_url)  }
         format.js   { @current_item = @line_item }
         format.xml  { render :xml => @line_item,
           :status => :created, :location => @line_item }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @line_item.errors,
           :status => :unprocessable_entity }
       end
     end
   end

  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(@line_item, notice: 'Line item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xml: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @line_item = LineItem.find(params[:id])
      @line_item.destroy

      respond_to do |format|
        format.html { redirect_to(line_items_url) }
        format.xml  { head :ok }
      end
 end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
