class Category < ActiveRecord::Base
	mount_uploader :image, CategoryImageUploader
	belongs_to :department, counter_cache: true
	has_many :products
end
