puts "== CREATING support messages =="
c = 0
User.last(15).each do |user|
	c += 1
	paragraph_count =  Faker::Number.between(15, 35)
	SupportMessage.create(email: user.email, content: Faker::Lorem.paragraph(paragraph_count, false, 4))
	puts "#{c} | #{user.email} "
end
puts "== DONE, created 15 support messages ==\n\n"