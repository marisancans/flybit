image_array = ["microsoft_surface_random.jpg", "mouse_yellow_random.jpg", "logitech_controller_random.jpg", 
               "msi_laptop_random.jpg", "power_bank_random.jpg", "mouse_black_random.jpg", 
               "intel_all_in_one_pc_random.jpg", "computer_black_random.jpg", "tablet_black_random.jpg",
               "windows_tablet_random.jpg", "headphones_black_random.jpg"]
#Generate images (Attachments)
@upload = true
c = 0
puts "== CREATING attachments =="
Product.find_each do |product|
  c += 1
  img = image_array.sample
  attachment = Attachment.create!(product_id: product.id)
  attachment.save
  attachment[:image] = img
	attachment.save

  puts "#{c}: #{img} for product id: #{product.id}"
end
puts "== DONE, created #{c} attachments ==\n\n" 