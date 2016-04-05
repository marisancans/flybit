class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  module CurrentCart
  	extend ActiveSupport::Concern

  	private

  		def set_cart
        #@current_cart = session[:cart_id] ? Cart.find(session[:cart_id]) : Cart.create
  			@cart = Cart.find(session[:cart_id])
  		rescue ActiveRecord::RecordNotFound
  			@cart = Cart.create
  			session[:cart_id] = @cart.id
        if current_user
          current_user.cart_id = @cart.id
        end
  		end
  end

end
