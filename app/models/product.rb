class Product < ActiveRecord::Base
	 belongs_to :department, dependent: :destroy
	 #has_many :department
end
