class Inquirylist < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	# This dependency means when we destroy cart,
	# the dependent lineitems will be destroid too.
end
