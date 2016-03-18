10.times do
    email = Faker::Internet.email
    password = Faker::Internet::password(8, 20)
    User.create!(email: email,
                 password: password)
    puts "User | email: #{email} || password: #{password} | created"
end
puts "== CREATED 10 users =="