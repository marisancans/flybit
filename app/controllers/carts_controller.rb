class CartsController < ApplicationController

	def add
		id = params[:id]
		if session[:cart] then 
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end
	end

	def show 
		if session[:cart] then 
			@cart = session[:cart]
		else
			@cart = {}
		end
	end


end
