class Product < ActiveRecord::Base
	 belongs_to :department, dependent: :destroy
	 has_attached_file :image, styles: {thumbnail: "100x100#"}
	 #has_many :department
end
