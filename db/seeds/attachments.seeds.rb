image_array = ["iphone.jpg", "keyboard.jpeg", "vlad.jpg", "laptop.jpg", "smartphone.jpg", "earbuds.jpeg", "mouse.jpg", "router.jpg"]
#Generate images (Attachments)
c = 0
puts "== CREATING attachments =="
Product.find_each do |product|
  c += 1
  img = image_array.sample
  Attachment.create(image: Rails.root.join("public/seeds/product_images/#{img}").open, 
                    product_id: product.id)
  puts "#{c}: #{img} for product id: #{product.id}"
end
puts "== DONE, created #{c} attachments ==\n\n" 