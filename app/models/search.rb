Class Search< ActiveRecord::Base

	def search_products
			products = Product.where("title LIKE ?", "#{params[:keywords]}") if params[:keywords].present?
		return products
	end

end