# ruby '2.6.6'
source 'http://rubygems.org'

gem 'sinatra'
gem 'rack-flash3'
gem 'activerecord'
gem 'sinatra-activerecord', :git => "https://github.com/sinatra-activerecord/sinatra-activerecord.git"
gem 'rake'
gem 'require_all'
gem 'bcrypt'
gem 'puma'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
  gem 'tux'  
  gem 'shotgun'  
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
end
