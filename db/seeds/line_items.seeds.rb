cart = Cart.last.id
puts "Last cart = #{cart}"
puts "p_id | c_id | q"
5.times do
	quantity = Faker::Number.between(1,10)
	product_id = Faker::Number.between(1, 10)
	LineItem.create!(product_id: product_id,
									 cart_id: cart,
									 quantity: quantity)
	puts "#{product_id}  |  #{cart}  |  #{quantity}"

end