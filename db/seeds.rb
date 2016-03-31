


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
                                     'Wrist rests'],

          'Laptops'             =>  ['Accessories', 'Bags', 'Batteries',
                                     'Link']
  }

  #Generate departments
  puts "== CREATING manual departments =="
  c = 0
    dach.each do |key, array|
      c += 1
      description = Faker::Lorem.sentence
      Department.create!(name: "#{key}")
      puts "#{c}: #{key}"
    end
    puts "== DONE #{dach.count} departments ==\n\n"

  #Generate categories for each department
  puts "== CREATING manual categories =="
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

  puts "== DONE #{c} categories ==\n\n"


  #if choice == 1
  #  dn = Proc.new { name = Faker::Commerce.department  }



else
  #Seed database with these variables:
  #Categories are generated for each department between 1..5
  department_count = 5
  product_count = 10
  user_count = 10

  #Generate departments
  c = 0
  puts "== CREATING departments =="
  department_count.times do
    c += 1
  	name = Faker::Commerce.department
  	description = Faker::Lorem.sentence
  	Department.create!(name:  name)
    puts "#{c}: #{name}"
  end
  puts "== DONE, created #{department_count} departments ==\n\n"


  #Generate random count of categories on each deapartment
  puts "== CREATING categories =="
  d = 0
  c = 0
  department_count.times do 
    d += 1
    x = Faker::Number.between(1, 5)
    x.times do
      c += 1
      name = Faker::Commerce.department
      department_id = d
      Category.create!(name:  name,
                      department_id: department_id)
      puts "#{c}: #{name}, department id = #{department_id}"
    end
  end
  puts "== DONE, 1..5 categories for each of #{department_count} departments ==\n\n"
end


#List of image file names on dropbox, so they are randomly assigned
image_array = ["iphone.jpg", "pc.jpeg", "keyboard.jpeg", "laptop.jpg", "smartphone.jpg"]

#Generate products
c = 0
puts "== CREATING products =="
category_count = Category.count
product_count.times do
  c += 1
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
  puts "#{c}: #{title}, price = #{price}"
end
puts "== CREATED #{product_count} products ==\n\n"

#Generate users
c = 0
puts "== CREATING users =="
user_count.times do
    c += 1
    email = Faker::Internet.email
    password = Faker::Internet::password(8, 20)
    User.create!(email: email,
                 password: password)
 puts "#{c}: #{email}, password = #{password}"
end
puts "== DONE, created #{user_count} users\n\n" 

    #Generate test user
User.create!(email: "admin@example.com",
             password: "12345678")
puts "== User created, see in seeds file =="



puts "== DATABASE SEEDING DONE =="
