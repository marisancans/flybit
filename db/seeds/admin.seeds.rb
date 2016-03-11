email = "admin@example.com"
password = "password"
AdminUser.create!(email: email, password: password)
puts 'created admin with email: #{email} and password: #{password}'