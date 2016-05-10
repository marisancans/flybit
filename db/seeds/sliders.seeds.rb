puts "== CREATING sliders =="
c = 0
4.times do |slider|
	c += 1
	slider = Slider.create
	slider.save
	slider = "slider#{c}.jpg"
	slider.save
	puts "#{c} | slider#{c}.jpg "
end
puts "== DONE, created 4 sliders ==\n\n"