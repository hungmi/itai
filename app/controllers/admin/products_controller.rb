class Admin::ProductsController < Admin::ApplicationController
  before_filter :verify_logged_in
  def new
    @page_title = 'Add new product'
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      flash[:notice] = "A new product added"
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def edit
    @page_title = "Edit product"
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product edited"
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "Product removed"
    redirect_to admin_products_path
  end

  def index
    params[:sort] ||= "created_at DESC"  #default sort by created date
    if params[:search]
      @products = Product.search(params[:search]).all.order(params[:sort]).paginate(:per_page => 8, :page => params[:page])
    else
      @products = Product.all.order(params[:sort]).paginate(:per_page => 8, :page => params[:page])
    end
  end

  def show
  end


  private
  def product_params
    params.require(:product).permit(:title, :category_id, :subcategory_id, :brand_id, :tags, :image, :description, :model_name, :item_number, :part_number, :diameter, :size)
  end
end
