class Product < ActiveRecord::Base
	belongs_to :category, dependent: :destroy, counter_cache: true
	has_one :department, through: :category
	has_many :line_items
	has_many :orders, through: :line_items
	has_many :attachments
	accepts_nested_attributes_for :attachments, allow_destroy: true
	before_destroy :ensure_not_referenced_by_any_line_item

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

