class DepartmentsController < ApplicationController

	def selected_department
		@selected_departments = Department
	end

	def index
		@departments = Department.all
	end

end
