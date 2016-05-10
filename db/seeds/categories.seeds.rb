#department and category hash of arrays, name and image name
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
                                  ['Storage', 'storage.png'],
                                  ['Cooling', 'computers_cooling.png'],
                                  ['Chargers', 'chargers.png'],
                                  ['Webcams', 'webcams.png'],
                                  ['Carrying bags', 'carrying_bags.png'],
                                  ['Wrist rests', 'wrist_rest.png']],

      'Laptops'               =>  [['Accessories', 'laptop_accessories.png'],
                                  ['Bags', 'computers_cases.png'],
                                  ['Batteries', 'batteries.png'],
                                  ['chargers', 'chargers.png']]
}

#Generate categories for each department
puts "== CREATING manual categories =="
department_id = 0
category_count = 0
dach.each do |key, array|
    department_id += 1
    puts "---#{key}---"
    array.each_with_index do |array_of_category, category_index|
    img = array_of_category[1]
    Category.create!(name: "#{array_of_category[0]}", 
                    department_id: "#{department_id}",
                    image: "#{img}")
    puts "#{category_index + 1}|#{department_id}|#{img}"
    category_count += 1
  end
  puts "\n"
end
puts "== DONE, created #{category_count} categories ==\n\n"