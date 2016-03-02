class SubCategory < ActiveRecord::Base
	belongs_to :department, dependent: :destroy
end
