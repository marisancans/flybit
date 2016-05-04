class LineItem < ActiveRecord::Base

	belongs_to :order
	belongs_to :product
	belongs_to :cart, :counter_cache => true

 	def total_price
 		if !product.discount.blank?
  		(product.price - product.discount) * quantity
  	else
  		product.price * quantity
  	end
  end

  def check_qty
    self.destroy if self.qty.zero?
  end

end