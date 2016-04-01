source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#Image handling
gem "paperclip", "~> 4.3"
gem 'paperclip-dropbox', '~> 1.3', '>= 1.3.2'

#Bootstrap
gem 'autoprefixer-rails'
gem 'bootstrap-will_paginate'
gem 'bootstrap-sass'

#Authentication
gem 'devise'

#Database
gem 'pg'
gem 'taps'

#gem 'puma'

#Enviroment variables
gem "figaro"

#Admin
gem 'activeadmin', github: 'activeadmin'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do



  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

 	#gem 'guard-minitest'

 	gem 'newrelic_rpm'

 	#Database 
 	#Random data generatos
	gem 'faker'
	#More rake comands, specific seed files
	gem 'seedbank' 

	#gem "better_errors" 

	gem 'web-console'

end

group  :production do
	gem 'rails_12factor'
end