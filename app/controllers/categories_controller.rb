class CategoriesController < ApplicationController
	def index
		@categories = Category.where("department_id = ?", params[:selected]).map{ |c| [c.name, c.id] }
	end
end
