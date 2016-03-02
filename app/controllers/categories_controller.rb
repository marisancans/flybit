class CategoriesController < ApplicationController

	def selected_category
		@selected_categories = Category
	end

	def index
		@categories = Category.all
	end

end
