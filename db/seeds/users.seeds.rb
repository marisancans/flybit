user_count = 200
c = 0
user_count.times do
		c += 1
    email = Faker::Internet.email
    password = Faker::Internet::password(8, 20)
    User.create!(email: email,
                 password: password)
    puts "#{c}: user | email: #{email} || password: #{password} | created"
end
puts "== CREATED #{user_count} users =="