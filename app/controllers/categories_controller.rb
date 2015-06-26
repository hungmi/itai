class CategoriesController < ApplicationController
  # this is custom method in application_controller
  # before_action :auth_customer

  def show
  	@categories = Category.all # for category sidebar
  	@brands = Brand.all # for brand sidebar

  	@category = Category.find(params[:id])
  	@products = @category.products.paginate(:per_page => 9, :page => params[:page])
  	if params[:brand_id].present?
  		@products = @products.where("brand_id = ?", params[:brand_id]).paginate(:per_page => 9, :page => params[:page])
  	# @products = Product.where("category_id = ? AND brand_id = ?", params[:id],params[:brand_id]).paginate(:per_page => 9, :page => params[:page])
  	end
  end

  def showsub
    @categories = Category.all # for category sidebar
    @brands = Brand.all # for brand sidebar
    @category = Category.find(params[:id])
    @subcategory = @category.subcategories.find_by_id(params[:sub_id])
    @products = @subcategory.products.paginate(:per_page => 9, :page => params[:page])
  end
end
