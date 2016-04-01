department_array = ['Computers', 'Tablets', 
										'Laptops & Notebooks', 'Accessories', 
										'Laptops'] 

department_array.each_with_index do |name, index|
	Department.create!(name: name)
	puts "#{index + 1}: #{name}"
end