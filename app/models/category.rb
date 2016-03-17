class Category < ActiveRecord::Base
	belongs_to :department, counter_cache: true
end
