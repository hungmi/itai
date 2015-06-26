class Brand < ActiveRecord::Base
	has_many :products

	validates_presence_of :name

	def self.search(query)
		where("name like ?", "%#{query}%")
	end
end
