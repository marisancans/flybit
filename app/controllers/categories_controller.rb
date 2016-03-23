class CategoriesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:index]
	def index
		@categories = Category.where("department_id = ?", params[:selected]).map{ |c| [c.name, c.id] }
	end
end
