class DepartmentsController < ApplicationController
	include CurrentCart
	before_action :set_cart

	def index
		@departments = Department.all.order("id ASC")
		@images = ["laptops.jpeg", "tablets.jpeg", "laptops.jpeg", "accessories.jpeg", "laptops_many.png"]
	end
end