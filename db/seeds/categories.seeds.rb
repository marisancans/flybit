d = 0
Department.count.times do 
  d += 1
  x = Faker::Number.between(1, 5)
  x.times do
    name = Faker::Commerce.department
    department_id = d
    Category.create!(name:  name,
                    department_id: department_id)
  end
end
puts "-------CREATED random count of categories for #{d} departments -------"
