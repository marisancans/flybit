user_count = 100
c = 0
user_count.times do
		c += 1
    email = Faker::Internet.email
    password = Faker::Internet::password(8, 20)
    created_at = Faker::Time.between(DateTime.now - 365, DateTime.now + 365)
    User.create!(email: email,
                 password: password,
                 created_at: created_at)
    puts "#{c}: user | email: #{email} || password: #{password} | created"
end
puts "== CREATED #{user_count} users =="