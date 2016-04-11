class DepartmentsController < ApplicationController
	include CurrentCart
	before_action :set_cart

	def index
		@departments = Department.all
	end
end