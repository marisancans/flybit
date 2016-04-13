image_array = ["iphone.jpg", "pc.jpeg", "keyboard.jpeg", "laptop.jpg", "smartphone.jpg"]
print "How many products? : "
choice = STDIN.gets.chomp.to_i
counter = 0
choice.times do
  counter += 1
  title  = Faker::Commerce.product_name
  description = Faker::Lorem.sentence
  price = Faker::Commerce.price
  department_id = Faker::Number.between(1, 5)
  category_id = Faker::Number.between(1, 10)
  Product.create!(title:  title,
                  description: description,
                  price: price,
                  department_id: department_id,
                  category_id: category_id,
                  images: image_array.sample)
  puts "#{counter}| #{title} cat_id: #{category_id}, dep_id: #{department_id}"
end
puts '-------CREATED #{choice} products-------'