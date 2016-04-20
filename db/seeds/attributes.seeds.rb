puts "== CREATING attachments =="
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


