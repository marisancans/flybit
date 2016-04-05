class LineItem < ActiveRecord::Base

	belongs_to :order
	belongs_to :product
	belongs_to :cart, :counter_cache => true

 	def total_price
  		product.price * quantity
  end

  def check_qty
    self.destroy if self.qty.zero?
  end

end