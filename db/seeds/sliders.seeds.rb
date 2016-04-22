puts "== CREATING sliders =="
c = 0
4.times do |slider|
	c += 1
	Slider.create!(image: Rails.root.join("public/seeds/sliders/slider#{c}.jpg").open)
	puts "#{c} | slider#{c}.jpg "
end
puts "== DONE, created 4 sliders ==\n\n"