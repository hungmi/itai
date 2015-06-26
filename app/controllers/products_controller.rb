class ProductsController < ApplicationController
  # this is custom method in application_controller
  # before_action :auth_customer, :except => [:index]

  def index
  	@categories = Category.all
  	@brands = Brand.all
    if params[:search]
      @page_title = "Search for: " + params[:search]
      @products = Product.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 9, :page => params[:page])
    else
      @page_title = "All Products"
      @products = Product.all.order('created_at DESC').paginate(:per_page => 9, :page => params[:page])
    end
  end

  def show
    @categories = Category.all
    @brands = Brand.all
    @product = Product.includes(:category,:brand).find(params[:id])
  end
end
