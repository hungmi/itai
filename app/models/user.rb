class User < ActiveRecord::Base
	attr_accessor :password
	before_save :encrypt_password
	has_many :posts

	validates_presence_of :name, :email, :password
	validates :password, confirmation: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_length_of :name, :minimum => 2 # 最少 2
  validates_length_of :password, :in => 6..20 # 介於 6~20

	def self.search(query)
		where("name like ? OR email like ?", "%#{query}%", "%#{query}%")
	end

	def self.authentication(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
		end
	end
end
