#Seed database with these variables for generated option
#Categories are generated for each department between 1..5
department_count = 5
product_count = 30
user_count = 10


print "\n 1 - Seed manual categories and department data from seed file \n 2 - Seed generated data \n"
print "Choice: "
choice = STDIN.gets.chomp.to_i


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
    dach.keys.each_with_index do |key, index|
      Department.create!(name: "#{key}")
      puts "#{index + 1}: #{key}" 
    end
  puts "== DONE, created #{dach.count} departments ==\n\n"

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

  #Code refractoring
  #if choice == 1
  #  dn = Proc.new { name = Faker::Commerce.department  }

else

  #Generate departments
  puts "== CREATING departments =="
  department_count.times do
    c += 1
  	name = Faker::Commerce.department
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
                  images: image_array.sample)
  puts "#{c}: #{title}, price = #{price}"
end
puts "== CREATED #{product_count} products ==\n\n"

#Generate users
c = 0
puts "== CREATING users =="
user_count.times do
    c += 1
    begin
      email = Faker::Internet::email
    end until !User.exists?(email: email)#Email uniqueness validation
    password = Faker::Internet::password(8, 20)
    User.create!(email: email,
                 password: password)
 puts "#{c}: #{email}, password = #{password}"
end
puts "== DONE, created #{user_count} users ==\n\n" 

#Generate test user
if User.exists?(email: "admin@example.com")
  puts "== ERROR, test user already exists! admin@example.com, password: password ==\n\n"
else
  User.create!(email: "admin@example.com",
               password: "password")
  puts "== User created, admin@example.com, password: password ==\n\n"
end

#Generate admin user
if AdminUser.exists?(email: "admin@example.com")
  puts "== ERROR, admin user already exists! admin@example.com, password: password ==\n\n"
else
  User.create!(email: "admin@example.com",
               password: "password")
  puts "== Admin user created, admin@example.com, password: password ==\n\n"
end


puts "== DATABASE SEEDING DONE =="