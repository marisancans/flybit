# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


print "\n 1 - Seed manual categories and department data from seed file \n 2 - Seed generated data \n"
print "Choice: "
choice = STDIN.gets.chomp


if choice == 1 
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
                                     'Wrist rests']
  }


  dach.each do |key, array|
    puts "#{key}-----"
    puts array
  end


  #Generate departments
  5.times do
    dach.each do |key, array|
      description = Faker::Lorem.sentence
      Department.create!(name: "#{key}",
                           description: description)
    end
  end


  #if choice == 1
  #  dn = Proc.new { name = Faker::Commerce.department  }



  else
    #Seed database with these variables:
    #Categories are generated for each department between 1..5
    department_count = 5
    product_count = 10
    user_count = 10

    #Generate test user
    puts "== CREATED #{user_count} users =="
    User.create!(email: "admin@example.com",
                 password: "12345678")
    puts "== User created, see in seeds file =="


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

    puts "== DONE =="
end