class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :auth_customer, :current_inquirylist, :how_many_lineitems, :get_lineitems, :check_if_lineitem_exist, :update_quantity

  before_filter :store_location
  before_filter :set_jumbotron

  def set_jumbotron
    @informations = Information.all
  end

  def update_quantity(inquirylist)
    ###################////////////////////////////////////
    inquirylist.line_items.update_attribute(:quantity, 20)
  end

  def check_if_lineitem_exist(product_id)
    current_item = LineItem.where(inquirylist_id: current_customer.id).find_by_product_id(product_id)
    if current_item
      true
    else
      false
    end
  end

  def how_many_lineitems
    line_items_number = LineItem.where(inquirylist_id: current_customer.id).count
    line_items_number
  end

  def get_lineitems(id)
    line_items = LineItem.where(inquirylist_id: id)
    line_items
  end

  def all_categories_subcat_brands_products
    @categories = Category.all
    @subcategories = Subcategory.all
    @brands = Brand.all
    @products = Product.all
  end

  def set_all_info
    @informations = Information.all
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/login" &&
        request.path != "/customers/sign_up" &&
        request.path != "/customers/password/new" &&
        request.path != "/customers/password/edit" &&
        request.path != "/customers/confirmation" &&
        request.path != "/customers/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  private

  def current_inquirylist
    #Inquirylist.find(session[:inquirylist_id])
    Inquirylist.find(current_customer.id)
  rescue ActiveRecord::RecordNotFound
    inquirylist = Inquirylist.create
    inquirylist.id = current_customer.id
    inquirylist.save
    # session[:inquirylist_id] = inquirylist.id
    inquirylist
  end

  def current_user
		@current_user ||=User.find(session[:user_id]) if session[:user_id]
	end
  
  def verify_logged_in
  	unless current_user
  		redirect_to admin_login_path
  	end
  end

  # this is for devise:user
  def auth_customer
    unless customer_signed_in?
      redirect_to new_customer_registration_url
      flash[:notice] = "Sign up for free. Please sign up or login to access the content."
    end
  end
end
