class InquirylistMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def inquiry_email(inquirylist)
    @inquirylist = inquirylist
    @line_items  = LineItem.where(inquirylist_id: @inquirylist.id)
    @customer = Customer.find(@inquirylist.id)
    mail(to: ENV["GMAIL_USERNAME"], subject: @customer.email + ' inquiries.')
  end
end