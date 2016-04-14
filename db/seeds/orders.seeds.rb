#Generate orders
c = 0
puts "== CREATING orders =="
User.last(10).reverse.each do |user|
c += 1
  Order.create!(name: Faker::Name.name , 
                address: Faker::Address.street_address, 
                email: user.email, 
                pay_type: "card",
                user_id: user.id,
                zip_code: Faker::Address.zip_code,
                city: Faker::Address.city,
                country: Faker::Address.country,
                country_code: Faker::Address.country_code)
  puts "#{c}: email = #{user.email}, user id: #{user.id}"
end