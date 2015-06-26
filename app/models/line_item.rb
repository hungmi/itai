class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :inquirylist

 	after_initialize :defaults

  def defaults
    self.quantity ||= 1
  end
end
