class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @customer_info = Customer
    @information = Information.first
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message. We will contact you soon!'
      redirect_to root_path
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  def customer_info_params
    params.require(:customer).permit(:company_name, :email, :country_code, :business_field, :business_type, :job_title, :telephone, :fax)
  end
end
