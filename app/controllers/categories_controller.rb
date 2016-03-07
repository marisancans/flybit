class CategoriesController < ApplicationController
	def index
		@categories = Category.where("department_id = ?", params[:selected])
	end

end
