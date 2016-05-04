class Product < ActiveRecord::Base
	belongs_to :category, dependent: :destroy, counter_cache: true
	has_one :department, through: :category
	has_many :line_items
	has_many :orders, through: :line_items
	has_many :attachments
	has_many :product_attributes
	accepts_nested_attributes_for :attachments, allow_destroy: true
	accepts_nested_attributes_for :product_attributes, allow_destroy: true
	before_destroy :ensure_not_referenced_by_any_line_item

	def self.search(search, selected)
		if selected.present?
	  	where("category_id = :selected AND title ILIKE :search", selected: selected, search: "%#{search}%" )
		else
			where("title ILIKE :search", search: "%#{search}%" )
		end
	end

	def discount_percent(original_price, discount_price)
		(discount_price / original_price) * 100
	end

	def price_with_discount(original_price, discount_price)
		if discount_price.present?
			original_price - discount_price 
		else
			original_price
		end
	end

	private
 		#ensure that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item
		 	if line_items.empty?
		 		return true
		 	else
		 		errors.add(:base, 'Line Items present')
		 		return false
			end
		end

end

