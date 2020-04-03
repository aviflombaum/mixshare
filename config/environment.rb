ENV['RACK_ENV'] ||= "development"
ENV['SINATRA_ENV'] ||= ENV['RACK_ENV']
ENV['RAILS_ENV'] = ENV['SINATRA_ENV']

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'].to_sym)
require 'netrc'
# require 'sinatra'
# require 'sinatra/json'
if ENV['RACK_ENV'] == "production"
  File.open("~/.netrc", "w+"){|f| } if !File.exists?("~/.netrc")
  n = Netrc.read("~/.netrc")
  n["surge.surge.sh"] = ENV["SURGE_USER"], ENV["SURGE_TOKEN"]
end

Dir.mkdir("./tmp") if !Dir.exists?("./tmp") 

set :environment, ENV['SINATRA_ENV'].to_sym

# ActiveRecord::Base.establish_connection(development_database_config)
set :database_file, 'database.yml'

require 'rack-flash'

require './app/controllers/application_controller'
require_all 'app'
