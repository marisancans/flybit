class CategoriesController < ApplicationController

	def index
		@categories = Category.find(params[:department_id])
	end
end
