# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Generate 30 products
image_array = ["iphone.jpg", "pc.jpeg", "keyboard.jpeg", "laptop.jpg", "smartphone.jpg"]


#Generate 5 departments
5.times do
	name = Faker::Commerce.department
	description = Faker::Lorem.sentence
	Department.create!(name:  name,
  								description: description)
end
puts '-------CREATED 5 department-------'

#Generate random count of categories on each deaprtment
Department.count.times do 
  x = rand(5)
  x.times do
    name = Faker::Commerce.department
    department_id = x
    Category.create!(name:  name,
                    department_id: department_id)
    puts "Category  #{name}, department_id: #{department_id} created"
  end
end
puts '-------CREATED some...catgories...needs fix-------'


10.times do
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
puts '-------CREATED 10 products-------'

#Generate users

10.times do
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')