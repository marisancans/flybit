5.times do 
	name = Faker::Commerce.product_name
	Department.create!(name: name)
	puts "Department #{name} created"
end