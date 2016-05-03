image_array = ["iphone.jpg", "keyboard.jpeg", "vlad.jpg", "laptop.jpg", "smartphone.jpg", "earbuds.jpeg", "mouse.jpg", "router.jpg"]
print "MAKE SURE DEPARTMENTS AND CATEGORIES ARE GENERATED BEFORE!"
print "How many products? : "
choice = STDIN.gets.chomp.to_i
category_count = Category.count
c = 0
choice.times do
  c += 1
  title  = ""
  title += Faker::Hacker.noun
  title += " " + Faker::Hacker.adjective
  title += " " + Faker::Hacker.verb
  title += " " + Faker::Hacker.noun
  title += " " + Faker::Hacker.verb
  paragraph_count =  Faker::Number.between(5, 20)
  description = Faker::Lorem.paragraph(paragraph_count, false, 4)
  price = Faker::Commerce.price

  if (1..20).member?(rand(1..100))
    begin
      discount = Faker::Commerce.price
    end while discount > price
  end

  if (1..10).member?(rand(1..100))
    special = true
  end

  department_id = Faker::Number.between(1, 5)
  category_id = Faker::Number.between(1, category_count)
  img = image_array.sample
  times_bought = Faker::Number.between(0, 100)
  Product.create!(title:  title.capitalize,
                  description: description,
                  price: price,
                  department_id: department_id,
                  category_id: category_id,
                  discount: discount,
                  times_bought: times_bought,
                  special: special)

  puts "#{c}: #{title}, price = #{price}, image = #{img}"
  Attachment.create(image: Rails.root.join("public/seeds/product_images/#{img}").open, 
                    product_id: Product.last.id)
  c = 0
  a = 0
  c += 1
  how_many = Faker::Number.between(5, 15)
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
                             product_id: Product.last.id)
  end
  puts "#{how_many} " + "attribute".pluralize(how_many) + " for product id = #{Product.last.id}"
end

puts "-------CREATED #{choice} products-------"