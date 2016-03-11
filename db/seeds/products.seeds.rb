image_array = ["iphone.jpg", "pc.jpeg", "keyboard.jpeg", "laptop.jpg", "smartphone.jpg"]
20.times do
  title  = Faker::Commerce.product_name
  description = Faker::Lorem.sentence
  price = Faker::Commerce.price
  department_id = Faker::Number.between(1, 5)
  category_id = Faker::Number.between(1, 10)
  Product.create!(title:  title,
                  description: description,
                  price: price,
                  department_id: 1,
                  category_id: 1,
                  image_file_name: image_array.sample)
  puts "Product  #{title} created"
end
puts '-------CREATED 20 products-------'