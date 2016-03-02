# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


30.times do
  title  = Faker::Commerce.product_name
  description = Faker::Lorem.sentence
  price = Faker::Commerce.price
  department_id = Faker::Number.between(1, 5)
  Product.create!(title:  title,
  								description: description,
  								price: price,
                  department_id: department_id)
end

5.times do
	name = Faker::Commerce.department
	description = Faker::Lorem.sentence
	Department.create!(name:  name,
  								description: description)
end
