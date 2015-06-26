class Admin::BrandsController < Admin::ApplicationController
  before_filter :verify_logged_in
  def new
    @page_title = 'Add Brand'
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:notice] = 'New brand is created'
      redirect_to admin_brands_path
    else
      render 'new'
    end
  end

  def edit
    @page_title = "Edit Brand"
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      flash[:notice] = 'Brand has been edited'
      redirect_to admin_brands_path
    else
      flash[:alert] = 'Editing failed'
      render 'edit'
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    flash[:notice] = 'Brand has been deleted'
    redirect_to admin_brands_path
  end

  def index
    @page_title = 'Manage Brands'
    @brands = Brand.all.order(:name)
    @categories = Category.all
  end

  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products
  end

  private
  def brand_params
    params.require(:brand).permit(:name, :category_id)
  end
end
