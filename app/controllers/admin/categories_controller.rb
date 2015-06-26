class Admin::CategoriesController < Admin::ApplicationController
  before_filter :verify_logged_in
  def new
    @page_title = "Add New Category"
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)    
    if @category.save
      flash[:notice] = 'Category"' + @category.name + '" Created'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    @page_title = 'Edit Category'
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'Category "' + @category.name + '" Updated'
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = 'Category "' + @category.name + '" Deleted'
      redirect_to admin_categories_path
    else
      flash[:notice] = 'Category "' + @category.name + '" is not Deleted'
      redirect_to admin_categories_path
    end
  end

  def index
    if params[:search]
      @page_title = "Search for: " + params[:search]
      @categories = Category.search(params[:search]).all.order(:name).paginate(:per_page => 10, :page => params[:page])
    else      
      @categories = Category.all.order(:name).paginate(:per_page => 10, :page => params[:page])
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def newsub
    @category = Category.find(params[:id])
    @page_title = "Add New Subcategory of " + @category.name
    @subcategory = Subcategory.new    
  end

  def createsub
    @category = Category.find(params[:id])
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      flash[:notice] = 'Subcategory"' + @subcategory.name + '"is created of ' + @category.name
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def indexsub
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
  end

  def showsub
    @subcategory = Subcategory.find(params[:sub_id])
    @products = @subcategory.products
  end

  def editsub
    @category = Category.find(params[:id])
    @subcategory = Subcategory.find(params[:sub_id])
  end

  def updatesub
    @subcategory = Subcategory.find(params[:sub_id])
    if @subcategory.update(subcategory_params)
      flash[:notice] = 'Subcategory "' + @subcategory.name + '" Updated'
      redirect_to admin_subcategories_path
    else
      render 'edit'
    end
  end

  def destroysub
    @subcategory = Subcategory.find(params[:sub_id])
    if @subcategory.destroy
      flash[:notice] = "subcategory destroyed."
      redirect_to admin_subcategories_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end
end
