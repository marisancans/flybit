class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	validates :name, :address, :email, presence: true
	belongs_to :user, :counter_cache => true
	STATUSES = ["Placed", "Changed", "Shipped", "Received"]
	PAYMENT_TYPES = [ "Card", "PayPal"]
	validates :status, inclusion: STATUSES, presence: true                     
	validates :pay_type, inclusion: PAYMENT_TYPES, presence: true  

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end
end