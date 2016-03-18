# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Seed database with these variables:
#Categories are generated for each department between 1..5
department_count = 5
product_count = 10
user_count = 10


#Generate departments
department_count.times do
	name = Faker::Commerce.department
	description = Faker::Lorem.sentence
	Department.create!(name:  name,
  								description: description)
end
puts "== CREATED #{department_count} departments =="


#Generate random count of categories on each deapartment
d = 0
department_count.times do 
  d += 1
  x = Faker::Number.between(1, 5)
  x.times do
    name = Faker::Commerce.department
    department_id = d
    Category.create!(name:  name,
                    department_id: department_id)
  end
end
puts "== CREATED random count of categories for #{department_count} departments =="


#List of image file names on dropbox, so they are randomly assigned
image_array = ["iphone.jpg", "pc.jpeg", "keyboard.jpeg", "laptop.jpg", "smartphone.jpg"]

#Generate products
category_count = Category.count
product_count.times do
  title  = Faker::Commerce.product_name
  description = Faker::Lorem.sentence
  price = Faker::Commerce.price
  department_id = Faker::Number.between(1, 5)
  category_id = Faker::Number.between(1, category_count)
  Product.create!(title:  title,
                  description: description,
                  price: price,
                  department_id: department_id,
                  category_id: category_id,
                  image_file_name: image_array.sample)
end
puts "== CREATED #{product_count} products =="

#Generate users

user_count.times do
    email = Faker::Internet.email
    password = Faker::Internet::password(8, 20)
    User.create!(email: email,
                 password: password)
end
puts "== CREATED #{user_count} users =="

#Generate admin user
email = "admin@example.com"
password = "password"
AdminUser.create!(email: email, password: password)
puts "created admin with email: #{email} and password: #{password}"