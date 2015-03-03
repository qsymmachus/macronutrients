source 'https://rubygems.org'
ruby '2.1.2'

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

# Use Thin for our web server
gem 'thin'

gem 'activesupport'
gem 'activerecord'

gem 'rake'

gem 'shotgun'

gem 'fatsecret-api'

gem 'dotenv'

gem 'rspec'

gem 'simplecov', :require => false, :group => :test

gem 'redis'
gem 'sidekiq'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
end

group :test, :development do
  gem 'rspec'
  gem 'factory_girl'
  gem 'faker'
end