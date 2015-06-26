class PagesController < ApplicationController
  before_action :all_categories_subcat_brands_products
  before_action :set_all_info, except: [:contact]

  def home
  end

  def about
  end

  def contact
  end
end
