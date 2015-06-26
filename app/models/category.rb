class Category < ActiveRecord::Base
	has_many :products
	has_many :subcategories

	validates_presence_of :name

	def self.search(query)
		where("name like ?", "%#{query}%")
	end
end
