source 'https://rubygems.org'

gem 'airbrake'
gem 'bourbon'
gem 'flutie'
gem 'high_voltage'
gem 'jquery-rails'
gem 'pg'
gem 'psych'
gem 'rack-timeout'
gem 'rails', '>= 3.2.11'
gem 'recipient_interceptor'
gem 'simple_form'
gem 'strong_parameters'
gem 'thin'

group :assets do
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'uglifier'
end

group :development do
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'sham_rack'
end

group :test do
  gem 'bourne', require: false
  gem 'capybara-webkit', '>= 0.14.1'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
end

group :staging, :production do
  gem 'newrelic_rpm'
end
