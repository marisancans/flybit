print "How many products? : "
choice = STDIN.gets.chomp.to_i
category_count = Category.count
c = 0
choice.times do
c += 1
  title  = Faker::Commerce.product_name
  description = Faker::Lorem.sentence
  price = Faker::Commerce.price
  department_id = Faker::Number.between(1, 5)
  category_id = Faker::Number.between(1, category_count)
  Product.create!(title:  title,
                  description: description,
                  price: price,
                  department_id: department_id,
                  category_id: category_id)
  Attachment.create(image: Rails.root.join("public/uploads/seeds/#{img}").open, 
                    product_id: Product.last.id))
  puts "#{c}: #{title}, price = #{price}"
end
puts '-------CREATED #{choice} products-------'