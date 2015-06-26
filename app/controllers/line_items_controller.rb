class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_current_inquirylist, only: [:create, :update, :destroy]
  before_action :store_location, only: [:create]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @inquirylist.line_items.build(product: product)
    if @line_item.save
      redirect_to session[:previous_url], notice: 'One item was successfully added.'
      
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to @inquirylist, notice: 'One item was successfully updated.'        
    else
      render :edit
    end    
  end

  def destroy
    @line_item.destroy
    redirect_to @inquirylist, notice: 'One item was successfully destroyed.'          
  end

  def destroy_all
    @inquirylist = Inquirylist.find(params[:id])
    @inquirylist.line_items.destroy_all
    redirect_to @inquirylist, notice: 'All item was successfully destroyed.'          
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def set_current_inquirylist
    @inquirylist = current_inquirylist
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:product_id, :inquirylist_id, :quantity)
  end

end
