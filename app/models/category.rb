class Category < ActiveRecord::Base
	has_many :producs, dependent: :destroy
end
