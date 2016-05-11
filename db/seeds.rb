#Seed database with these variables for generated option
#Categories are generated for each department between 1..5
department_count = 5
product_count = 30
user_count = 10


print "\n 1 - Seed manual categories and department data from seed file \n 2 - Seed generated data \n"
print "Choice: "
choice = STDIN.gets.chomp.to_i


if choice == 1 

  #List of image file names on dropbox, so they are randomly assigned
  image_array = ["microsoft_surface_random.jpg", "mouse_yellow_random.jpg", "logitech_controller_random.jpg", 
               "msi_laptop_random.jpg", "power_bank_random.jpg", "mouse_black_random.jpg", 
               "intel_all_in_one_pc_random.jpg", "computer_black_random.jpg", "tablet_black_random.jpg",
               "windows_tablet_random.jpg", "headphones_black_random.jpg"]

  #dach = department and category hash
  #Each key is department and key value is array of categories
  dach = {'Computers'           => [['Cases', 'computers_cases.png'], 
                                    ['Cooling', 'computers_cooling.png'], 
                                    ['Memory (RAM)', 'computers_memory.png'],
                                    ['Motherboards', 'computers_motherboard.png'],
                                    ['Power supplies', 'computers_power_supply.png'],
                                    ['Processors', 'computers_processors.png'],
                                    ['Video cards','computers_video_cards.png'],
                                    ['Sound cards', 'computers_sound_cards.png'],
                                    ['Storage', 'computers_storage.png'],
                                    ['Pre-built PCs', 'computers_pre_built.png'],
                                    ['All-in-one PCs', 'computers_all_in_one.png']],

        'Tablets'               =>  [['Apple', 'apple.png'],
                                    ['Samsung', 'samsung.png'],
                                    ['Microsoft', 'microsoft.png'],
                                    ['Lenovo', 'lenovo.png'],
                                    ['Asus', 'asus.png'],
                                    ['Google', 'google.png'],
                                    ['Dell', 'dell.png'],
                                    ['Acer', 'acer.png'],
                                    ['7 inches', 'tablets_7_inches.jpg'],
                                    ['8 inches', 'tablets_8_inches.jpg'],
                                    ['9 inches', 'tablets_9_inches.png'],
                                    ['10 inches', 'tablets_10_inches.jpg'],
                                    ['12 inches','tablets_12_inches.png']],

        'Laptops & Notebooks' =>    [['Apple', 'apple.png'],
                                    ['Dell',  'dell.png'],
                                    ['HP', 'hp.png'],
                                    ['Lenovo', 'lenovo.png'],
                                    ['Asus', 'asus.png'],
                                    ['Acer', 'acer.png'],
                                    ['Alienware', 'alienware.png'],
                                    ['Sony', 'sony.png'],
                                    ['Toshiba', 'toshiba.png'],
                                    ['Windows', 'windows.png'],
                                    ['Mac OS', 'mac_os.png'],
                                    ['Chrome OS', 'chrome_os.jpg'],
                                    ['No OS', 'no_os.png'],
                                    ['Less than $500', '500_EUR.png'],
                                    ['$500 - $1000', '500_1000_EUR.png'],
                                    ['$1000+', '1000_EUR.png']],

        'Accessories'         =>    [['Mice', 'mouse.png'],
                                    ['Keyboards', 'keyboard.png'],
                                    ['Headphones','headphones.png'],
                                    ['Microphones', 'microphone.jpg'],
                                    ['Cases', 'computers_cases.png'],
                                    ['Styluses', 'styluses.png'],
                                    ['Storage', 'storage.jpeg'],
                                    ['Cooling', 'computers_cooling.png'],
                                    ['Chargers', 'chargers.png'],
                                    ['Webcams', 'webcams.jpeg'],
                                    ['Carrying bags', 'carrying_bags.png'],
                                    ['Wrist rests', 'wrist_rest.png']],

        'Laptops'               =>  [['Accessories', 'laptop_accessories.jpeg'],
                                    ['Bags', 'computers_cases.png'],
                                    ['Batteries', 'batteries.png'],
                                    ['chargers', 'chargers.png']]
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
    array.each_with_index do |array_of_category, category_index|
    img = array_of_category[1]
    category = Category.create!(name: "#{array_of_category[0]}", 
                    department_id: "#{department_id}")
    category.save
    category[:image] = img
    category.save
    puts "#{category_index + 1}|#{department_id}|#{img}"
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
  paragraph_count = Faker::Number.between(5, 20)
  description = Faker::Lorem.paragraph(paragraph_count, false, 4)
  price = Faker::Commerce.price
  department_id = Faker::Number.between(1, 5)
  category_id = Faker::Number.between(1, category_count)
  times_bought = Faker::Number.between(0, 100)

  if (1..20).member?(rand(1..100))
    begin
      discount = Faker::Commerce.price
    end while discount > price
  end

  if (1..10).member?(rand(1..100))
    special = true
  end

  new_product = Product.create(title:  title.capitalize,
                  description: description,
                  price: price,
                  department_id: department_id,
                  category_id: category_id,
                  discount: discount,
                  times_bought: times_bought,
                  special: special)
  new_product.save
  puts "#{c}: #{title}, price = #{price}"
end
puts "== CREATED #{product_count} products ==\n\n"

#Generate images (Attachments)
@upload = true
c = 0
puts "== CREATING attachments =="
  c += 1
  img = image_array.sample
  attachment = Attachment.create!(product_id: new_product.id)
  attachment.save
  attachment[:image] = img
  attachment.save

  puts "#{c}: #{img} for product id: #{product.id}"
end
puts "== DONE, created #{c} attachments ==\n\n" 

#Generate sliders
puts "== CREATING sliders =="
c = 0
4.times do |slider|
  c += 1
  slider = Slider.create
  slider.save
  slider[:image] = "slider#{c}.jpg"
  slider.save
  puts "#{c} | slider#{c}.jpg "
end
puts "== DONE, created 4 sliders ==\n\n"

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
product_count = Product.count
User.last(10).reverse.each do |user|
  c += 1
  amount = 0
  Order.create!(name: Faker::Name.name,
                status: Order::STATUSES.sample,
                address: Faker::Address.street_address, 
                email: user.email, 
                pay_type: Order::PAYMENT_TYPES.sample,
                user_id: user.id,
                zip_code: Faker::Address.zip_code,
                city: Faker::Address.city,
                country: Faker::Address.country,
                country_code: Faker::Address.country_code)
  Faker::Number.between(1, 10).times do
  LineItem.create!(product_id: Faker::Number.between(1, product_count),
                   quantity: Faker::Number.between(1, 10),
                   order_id: Order.last.id)
  amount += LineItem.last.total_price
  end
  Order.last.update(amount: amount)
  puts "#{c}: email = #{user.email}, user id: #{user.id}"
end
puts "== DONE, created #{c} orders ==\n\n" 

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