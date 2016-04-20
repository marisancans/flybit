cart_id = Cart.last.id
puts "Last cart = #{cart_id}"
puts "p_id | c_id | q"
5.times do
	product_id = Faker::Number.between(1, 10)
	quantity = Faker::Number.between(1, 10)
	LineItem.create!(product_id: product_id,
									 cart_id: cart_id,
									 quantity: quantity)
	puts "#{product_id} | #{cart_id} | #{quantity}"

end