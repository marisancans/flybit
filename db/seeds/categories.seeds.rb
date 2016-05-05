#department and category hash of arrays, name and image name
dach = {'Computers'           => [['Cases', 'computers_cases.png'], 
                                  ['Cooling', 'computers_cooling.png'], 
                                  ['Memory (RAM)', 'computers_memory'],
                                  ['Motherboards', 'computers_motherboard.png'],
                                  ['Power supplies', 'computers_power_supply.png'],
                                  ['Processors', 'computers_processors.png'],
                                  ['Video cards','computers_video_cards.png'],
                                  ['Sound cards', 'computers_sound_cards.png'],
                                  ['Storage', 'computers_storage.png'],
                                  ['Pre-built PCs', 'computers_pre_built.png'],
                                  ['All-in-one PCs', 'computers_all_in_one.png'],

      'Tablets'               =>  ['Apple', 'apple.png'],
                                  ['Samsung', 'samsung.png'],
                                  ['Microsoft', 'microsoft.png'],
                                  ['Lenovo', 'lenovo.png'],
                                  ['Asus', 'asus.png'],
                                  ['Google', 'google.png'],
                                  ['Dell', 'dell.png'],
                                  ['Acer', 'acer.png'],
                                  ['7 inches', 'laptops_7_inches.jpg'],
                                  ['8 inches', 'laptops_8_inches.jpg'],
                                  ['9 inches', 'laptops_9_inches.png'],
                                  ['10 inches', 'laptops_10_inches.jpg'],
                                  ['12 inches','laptops_12_inches.png'],

      'Laptops & Notebooks' =>    ['Apple', 'apple.png'],
                                  ['Dell',  'dell.png'],
                                  ['HP', 'hp.png'],
                                  ['Lenovo', 'lenovo.png'],
                                  ['Asus', 'asus.png'],
                                  ['Acer', 'acer.png'],
                                  ['Alienware', 'alienware.png'],
                                  ['Sony', 'sony.png'],
                                  ['Toshiba', 'toshiba.png'],
                                  ['Windows', 'windows.png'],
                                  ['Mac OS', 'mac_os'],
                                  ['Chrome OS', 'chrome_os.jpg'],
                                  ['No OS', 'no_os.png'],
                                  ['Less than $500',------------
                                  ['$500 - $1000', -------------
                                  ['$1000+'--------

      'Accessories'         =>  ['Mice', 'Keyboards', 'Headphones',
                                 'Microphones', 'Cases', 'Styluses',
                                 'Storage', 'Cooling', 'Chargers',
                                 'Webcams', 'Carrying bags', 'Storage',
                                 'Wrist rests'],

      'Laptops'             =>  ['Accessories', 'Bags', 'Batteries',
                                 'Link']
}

image: Rails.root.join("public/seeds/category_images/#{img}"


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
puts hash.first
