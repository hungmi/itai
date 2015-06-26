class InquirylistsController < ApplicationController
  before_action :set_inquirylist, only: [:show, :edit, :update, :destroy, :send_inquiry_mail]
  respond_to :html, :js

  def index
  end

  def show
  end

  def new
    @inquirylist = Inquirylist.new
  end

  def create
    @inquirylist = Inquirylist.new(inquirylist_params)

    respond_to do |format|
      if @inquirylist.save
        format.html { redirect_to @inquirylist, notice: 'Your inquiry list was successfully created.' }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @inquirylist.update(inquirylist_params)
        format.html { redirect_to @inquirylist, notice: 'Your inquiry list was successfully updated.' }
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @inquirylist.destroy
    respond_to do |format|
      format.html { redirect_to inquirylists_url, notice: 'Your inquiry list was successfully destroyed.' }
    end
  end

  def send_inquiry_mail
    sleep 1
    InquirylistMailer.inquiry_email(@inquirylist).deliver
    #@inquirylist.line_items.destroy_all
    flash[:notice] = "Thanks for your inquiry. We will contact you as soon as possible."
    redirect_to inquirylist_path(@inquirylist.id)    
  end

  private    

    # Use callbacks to share common setup or constraints between actions.
    def set_inquirylist
      @inquirylist = Inquirylist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquirylist_params
      params[:inquirylist]
    end
end
