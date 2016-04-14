class Gallery < ActiveRecord::Base
	belongs_to :product
	has_many :images
	accepts_nested_attributes_for :images, allow_destroy: true
end
