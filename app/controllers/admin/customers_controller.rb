class Admin::CustomersController < Admin::ApplicationController
  before_filter :verify_logged_in

  def index
    if params[:search]
      @customers = Customer.search(params[:search]).all.order(params[:sort]).paginate(:per_page => 8, :page => params[:page])
    else
      @customers = Customer.all.order(params[:sort]).paginate(:per_page => 10, :page => params[:page])
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
    @page_title = "Add New Customer"
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save(customer_params)
        flash[:notice] = "Customer added. Please inform the customer to check their email for confirmation."
        redirect_to admin_customers_path
    else
      # flash[:alert] = "Failed. Please try again."
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
    @page_title = "Edit " + @customer.email
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "Customer updated"
      redirect_to admin_customers_path
    else
      # flash[:alert] = "Failed. Please try again."
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "Customer removed"
    redirect_to admin_customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:company_name, :email, :password, :password_confirmation, :country_code, :business_field, :business_type, :job_title, :telephone, :fax)
  end
end
