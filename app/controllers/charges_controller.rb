# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://dashboard.stripe.com/account/apikeys

# Get the credit card details submitted by the form
# Create the charge on Stripe's servers - this will charge the user's card

class ChargesController < ApplicationController
	include CurrentCart
  before_action :set_cart, only: [:new, :create]
  Stripe.api_key = Rails.configuration.stripe[:stripe_secret_key]

	def new
	end

	def create
	  # Amount in cents
		token = params[:stripeToken]
	  charge = Stripe::Charge.create(
	    :amount      => 500,
	    :description => 'Rails Stripe customer',
	    :currency    => 'eur',
	    :source => token
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end



end

