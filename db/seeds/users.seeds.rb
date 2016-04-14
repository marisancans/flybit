print "How many users? : "
user_count  = STDIN.gets.chomp.to_i
c = 0
user_count.times do
		c += 1
    email = Faker::Internet.email
    password = Faker::Internet::password(8, 20)
    if User.exists?(email: email)
		  puts "== ERROR, test user already exists! user@example.com, password: password ==\n\n"
		else
		  User.create!(email: email,
		               password: "password")
		end
    puts "#{c}: user | email: #{email} || password: #{password} | created"
end
puts "== CREATED #{user_count} users =="

