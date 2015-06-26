class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :company_name, presence: true
  validates :business_field, presence: true
  validates :country_code, presence: true
  validates :telephone, presence: true

  
  include Humanizer
  require_human_on :create

  def self.search(query)
		where("email like ? OR company_name like ? OR country_code like ? OR telephone like ? OR fax like ? OR business_field like ?  OR business_type like ? ", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end
end
