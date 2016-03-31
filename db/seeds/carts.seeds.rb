#OrderStatus.create! id: 1, name: "In Progress"
#OrderStatus.create! id: 2, name: "Placed"
#OrderStatus.create! id: 3, name: "Shipped"
#OrderStatus.create! id: 4, name: "Cancelled"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


print "\n 1 - Seed manual categories and department data from seed file \n 2 - Seed generated data \n"
print "Choice: "

  #dach = department and category hash
  #Each key is department and key value is array of categories
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

          'Laptops'							=>  ['Accessories', 'Bags', 'Batteries',
          													 'Link']
  }


  #Generate departments
  c = 0
    dach.each do |key, array|
    	c += 1
      description = Faker::Lorem.sentence
      Department.create!(name: "#{key}")
      puts "#{c}: #{key}"
    end

  c = 0
  dach.each do |key, array|
  		puts "---#{key}---"
  	array.each do |name|
  		c += 1
  		Category.create!(name: "#{name}")
  		puts "#{c}: #{name}"
  	end
  	puts "\n"
  end


