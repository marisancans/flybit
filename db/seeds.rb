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
                                    'Pre-buillt PCs', 'All-in-one PCs', 'Monitors'],

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

#Generate products
c = 0
puts "== CREATING products =="
category_count = Category.count
product_count.times do
  c += 1
  title  = ""
  title += Faker::Hacker.noun
  title += " " + Faker::Hacker.adjective
  title += " " + Faker::Hacker.verb
  title += " " + Faker::Hacker.noun
  title += " " + Faker::Hacker.verb
  description = Faker::Lorem.paragraphs
  price = Faker::Commerce.price
  department_id = Faker::Number.between(1, 5)
  category_id = Faker::Number.between(1, category_count)
  Product.create!(title:  title,
                  description: description,
                  price: price,
                  department_id: department_id,
                  category_id: category_id)
  puts "#{c}: #{title}, price = #{price}"
end
puts "== CREATED #{product_count} products ==\n\n"

#List of image file names on dropbox, so they are randomly assigned
image_array = ["iphone.jpg", "keyboard.jpeg", "vlad.jpg", "laptop.jpg", "smartphone.jpg", "earbuds.jpeg", "mouse.jpg", "router.jpg"]

#Generate images (Attachments)
c = 0
puts "== CREATING attachments =="
Product.find_each do |product|
  c += 1
  img = image_array.sample
  Attachment.create(image: Rails.root.join("public/uploads/seeds/#{img}").open, 
                    product_id: product.id)
  puts "#{c}: #{img} for product id: #{product.id}"
end
puts "== DONE, created #{c} attachments ==\n\n" 

#Generate attributes
puts "== CREATING attributes =="
c = 0
a = 0
Product.find_each do |product|
  c += 1
  how_many = Faker::Number.between(1, 10)
  how_many.times do
    a += 1
    details = ""
    details += Faker::Hacker.adjective
    details += " " + Faker::Hacker.verb
    #r_d_a = random details addon
    r_d_a = Faker::Number.between(1, 4)
    case r_d_a
      when 1
        details += Faker::StarWars.droid
      when 2
        details += Faker::Beer.blg
      when 3
        details += " " + Faker::Number.between(1, 4).to_s
      when 4 
        details += " " +Faker::Number.hexadecimal(3)
    end
    ProductAttribute.create!(title: Faker::Hacker.noun,
                             details: details,
                             product_id: product.id)
  end
  puts "#{how_many} " + "attribute".pluralize(how_many) + " for product id = #{product.id}"
end
puts "== DONE, created #{a} attributes ==\n\n"

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

#Generate orders
c = 0
puts "== CREATING orders =="
User.last(10).reverse.each do |user|
c += 1
  Order.create!(name: Faker::Name.name , 
                address: Faker::Address.street_address, 
                email: user.email, 
                pay_type: "card",
                user_id: user.id,
                zip_code: Faker::Address.zip_code,
                city: Faker::Address.city,
                country: Faker::Address.country,
                country_code: Faker::Address.country_code)
  puts "#{c}: email = #{user.email}, user id: #{user.id}"
end
puts "== DONE, created #{user_count} users ==\n\n" 

#Generate test user
if User.exists?(email: "user@example.com")
  puts "== ERROR, test user already exists! user@example.com, password: password ==\n\n"
else
  User.create!(email: "user@example.com",
               password: "password")
  puts "== User created, user@example.com, password: password ==\n\n"
end

#Generate admin user
if AdminUser.exists?(email: "admin@example.com")
  puts "== ERROR, admin user already exists! admin@example.com, password: password ==\n\n"
else
  email = "admin@example.com"
  password = "password"
  AdminUser.create!(email: email, password: password)
  puts "created admin with email: #{email} and password: #{password}"
  puts "== Admin user created, admin@example.com, password: password ==\n\n"
end




puts "== DATABASE SEEDING DONE =="