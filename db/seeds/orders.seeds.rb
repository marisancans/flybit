#Generate orders
c = 0
puts "== CREATING orders =="
product_count = Product.count
User.last(10).reverse.each do |user|
  c += 1
  amount = 0
  Order.create!(name: Faker::Name.name,
                status: Order::STATUSES.sample,
                address: Faker::Address.street_address, 
                email: user.email, 
                pay_type: Order::PAYMENT_TYPES.sample,
                user_id: user.id,
                zip_code: Faker::Address.zip_code,
                city: Faker::Address.city,
                country: Faker::Address.country,
                country_code: Faker::Address.country_code)
  Faker::Number.between(1, 10).times do
  LineItem.create!(product_id: Faker::Number.between(1, product_count),
                   quantity: Faker::Number.between(1, 10),
                   order_id: Order.last.id)
  amount += LineItem.last.total_price
  end
  Order.last.update(amount: amount)
  puts "#{c}: email = #{user.email}, user id: #{user.id}"
end
