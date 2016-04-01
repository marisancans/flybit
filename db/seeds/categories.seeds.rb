dach = {'Computers'           => ['Cases', 'Cooling', 'Memory (RAM)',
                                'Motherboards','Power supplies', 'Processors', 
                                'Video cards','Sound cards', 'Storage',
                                'Pre-buillt PCs', 'All-in-one PCs'],

      'Tablets'             =>  ['Apple', 'Samsung', 'Microsoft',
                                 'Lenovo', 'Asus', 'Google', 'Dell', 
                                 'Acer', '7 inches', '8 inches', 
                                 '9 inches', '10 inches', '12 inches'],

      'Laptops & Notebooks' =>  ['Apple', 'Dell', 'HP',
                                 'Lenovo', 'Asus', 'Acer',
                                 'Alienware', 'Sony', 'Toshiba',
                                 'Windows', 'Mac OS', 'Chrome OS',
                                 'No OS', 'Less than $500', '$500 - $1000',
                                 '$1000+'],

      'Accessories'         =>  ['Mice', 'Keyboards', 'Headphones',
                                 'Microphones', 'Cases', 'Styluses',
                                 'Storage', 'Cooling', 'Chargers',
                                 'Webcams', 'Carrying bags', 'Storage',
                                 'Wrist rests'],

      'Laptops'             =>  ['Accessories', 'Bags', 'Batteries',
                                 'Link']
}

#Generate categories for each department
puts "== CREATING manual categories =="
department_id = 0
category_count = 0
dach.each do |key, array|
    department_id += 1
    puts "---#{key}---"
    array.each_with_index do |name, category_index|
    Category.create!(name: "#{name}", department_id: "#{department_id}")
    puts "#{category_index + 1}|#{department_id}|#{name}"
    category_count += 1
  end
  puts "\n"
end
puts "== DONE, created #{category_count} categories ==\n\n"