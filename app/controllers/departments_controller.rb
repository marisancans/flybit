class DepartmentsController < ApplicationController

	def selected_department
		@selected_departments = Department
	end

	def index
		@departments = Departments.all
	end

end
