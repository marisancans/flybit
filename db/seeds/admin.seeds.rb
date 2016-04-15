if AdminUser.exists?(email: "admin@example.com")
  puts "== ERROR, admin user already exists! admin@example.com, password: password ==\n\n"
else
  email = "admin@example.com"
  password = "password"
  AdminUser.create!(email: email, password: password)
  puts "created admin with email: #{email} and password: #{password}"
  puts "== Admin user created, admin@example.com, password: password ==\n\n"
end