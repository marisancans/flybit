class Product < ActiveRecord::Base
	 belongs_to :category, dependent: :destroy
	 #has_many :category
end
