# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Generate 30 products
30.times do
  title  = Faker::Commerce.product_name
  description = Faker::Lorem.sentence
  price = Faker::Commerce.price
  department_id = Faker::Number.between(1, 5)
  category_id = Faker::Number.between(1, 10)
  Product.create!(title:  title,
  								description: description,
  								price: price,
                  department_id: department_id,
                  category_id: category_id)
end

#Generate 5 departments
5.times do
	name = Faker::Commerce.department
	description = Faker::Lorem.sentence
	Department.create!(name:  name,
  								description: description)
end

#Generate random count of categories on each deaprtment
Department.count.times do 
  x = rand(5)
  x.times do
    name = Faker::Commerce.department
    description = Faker::Lorem.sentence
    department_id = x
    Category.create!(name:  name,
                    description: description,
                    department_id: department_id)

  end
end
