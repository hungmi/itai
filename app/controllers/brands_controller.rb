class BrandsController < ApplicationController
	# this is custom method in application_controller
  # before_action :auth_customer

  def show
  	@categories = Category.all # for category sidebar
  	@brands = Brand.all # for brand sidebar

  	@brand = Brand.find(params[:id])
  	@products = @brand.products.paginate(:per_page => 9, :page => params[:page])
  	if params[:category_id].present?
  		@products = @products.where("category_id = ?", params[:category_id]).paginate(:per_page => 9, :page => params[:page])
  	# @products = Product.where("category_id = ? AND brand_id = ?", params[:category_id],params[:id]).paginate(:per_page => 9, :page => params[:page])
  	end
  end
end
