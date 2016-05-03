# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://dashboard.stripe.com/account/apikeys

# Get the credit card details submitted by the form
# Create the charge on Stripe's servers - this will charge the user's card

class ChargesController < ApplicationController
	include CurrentCart
  before_action :set_cart, only: [:checkout, :create]
  Stripe.api_key = ENV['stripe_secret_key']

	def checkout

	end

	def create
	  # Amount in cents
	  @price_paid = @cart.total_price
	  text = ""
	  @cart.line_items.each  do |item|
			text += item.product.title + "(#{item.quantity}x), "
		end
	  @items_bought = text
		token = params[:stripeToken]
	  charge = Stripe::Charge.create(
	    :amount      => (@cart.total_price * 100).to_i,
	    :description =>  text,
	    :currency    => 'eur',
	    :source => token
	  )
	  user_id = current_user.id if user_signed_in?
	  order = Order.create!( name: params[:stripeBillingName],
	  											 address: params[:stripeBillingAddressLine1],
	  										 	 email: params[:stripeEmail],
	  										 	 pay_type: params[:stripeTokenType],
	  										 	 user_id: user_id,
	  										 	 zip_code: params[:stripeShippingAddressZip],
	  										 	 city: params[:stripeShippingAddressCity],
	  										 	 country: params[:stripeShippingAddressCountry],
	  										 	 country_code: params[:stripeShippingAddressCountryCode]
	  )
	  @cart.line_items.each do |line_item|
		  line_item.product.update(times_bought: line_item.product.times_bought += line_item.quantity)
		end
	  order.add_line_items_from_cart(@cart)
	  session[:cart_id] = nil

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

	
end
