class Category < ActiveRecord::Base
	mount_uploader :image, CategoryImageUploader
	belongs_to :department, counter_cache: true
	has_many :products

	scope :uniq_product_categories, lambda { |category_ids| find(category_ids).merge(category_ids)}
	
end
