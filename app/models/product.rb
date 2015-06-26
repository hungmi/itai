class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :subcategory
	belongs_to :brand
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	# this method ensures no dependent lineitems when destroy,
	# thus no need to set dependent: :destroy.

	validates :title, presence: true
	validates :category_id, presence: true
	#validates :brand_id, presence: true

	def self.search(query)
		if query =~ /\s+/
			query = query.strip.split(/\s+/)
			i = 0
			result = where("lower(title) like ? OR lower(model_name) like ? OR lower(part_number) like ? OR lower(item_number) like ? OR lower(diameter) like ? OR lower(size) like ? OR lower(description) like ? OR lower(tags) like ?", ("%#{query[0]}%").downcase, ("%#{query[0]}%").downcase, ("%#{query[0]}%").downcase, ("%#{query[0]}%").downcase, ("%#{query[0]}%").downcase, ("%#{query[0]}%").downcase, ("%#{query[0]}%").downcase, ("%#{query[0]}%").downcase)
			begin
				result = result.where("lower(title) like ? OR lower(model_name) like ? OR lower(part_number) like ? OR lower(item_number) like ? OR lower(diameter) like ? OR lower(size) like ? OR lower(description) like ? OR lower(tags) like ?", ("%#{query[i]}%").downcase, ("%#{query[i]}%").downcase, ("%#{query[i]}%").downcase, ("%#{query[i]}%").downcase, ("%#{query[i]}%").downcase, ("%#{query[i]}%").downcase, ("%#{query[i]}%").downcase, ("%#{query[i]}%").downcase)
				i += 1
			end while !query[i].blank?
			result
		else
			where("lower(title) like ? OR lower(model_name) like ? OR lower(part_number) like ? OR lower(item_number) like ? OR lower(diameter) like ? OR lower(size) like ? OR lower(description) like ? OR lower(tags) like ?", ("%#{query}%").downcase, ("%#{query}%").downcase, ("%#{query}%").downcase, ("%#{query}%").downcase, ("%#{query}%").downcase, ("%#{query}%").downcase, ("%#{query}%").downcase, ("%#{query}%").downcase)
		end
	end

	def self.random
 		self.limit(4).offset(rand(self.count - 3))
	end

	private
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end			
		end
end
