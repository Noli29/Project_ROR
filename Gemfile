source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'
gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '= 3.1.1.0'

  gem "will_paginate", "~> 3.0.4"
  gem 'bootstrap-will_paginate', '0.0.6'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  #gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

  gem "paperclip", "~> 4.2"
  gem 'cancan'
  gem 'pry'
  gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
  gem "bcrypt-ruby", :require => "bcrypt"

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'thin'
group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem  'quiet_assets'
end

group :test do
  gem 'simplecov'
  gem 'database_cleaner'
end
