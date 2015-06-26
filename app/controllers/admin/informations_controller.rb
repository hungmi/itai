class Admin::InformationsController < Admin::ApplicationController
  before_filter :verify_logged_in
  before_action :set_info, only:[:edit, :update, :destroy]
  def index
  	@page_title = "Informations"
 		@informations = Information.all
  end
  def new
    @page_title = "New Information Set"
    @information = Information.new
  end
  def create
    @page_title = "New Information Set"
    if @information = Information.create(info_params)
      redirect_to admin_informations_path, notice:'New Info set is created.'
    else
      flash[:notice] = "Failed, please try again."
      render 'new'
    end
  end
  def edit
  	@page_title = "Edit About Page"
  end
  def update
  	if @information.update(info_params)
  		redirect_to admin_informations_path, notice: "information updated successfully."
    else
      flash[:notice] = "Failed, please try again."
      render 'edit'
  	end
  end
  def destroy
    @information.destroy
    redirect_to admin_informations_path, notice: "information deleted successfully."
  end

  private 
  def info_params
  	params.require(:information).permit(:about, :company_skype, :address, :telephone, :fax, :mail_address, :JumbotronTitle, :JumbotronSubtitle, :JumbotronImg, :html_bg)
  end
end
