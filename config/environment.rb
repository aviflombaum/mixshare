ENV['RACK_ENV'] ||= "development"
ENV['SINATRA_ENV'] ||= ENV['RACK_ENV']
ENV['RAILS_ENV'] = ENV['SINATRA_ENV']

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'].to_sym)

# require 'sinatra'
# require 'sinatra/json'

Dir.mkdir("./tmp") if !Dir.exists?("./tmp") 

set :environment, ENV['SINATRA_ENV'].to_sym

# ActiveRecord::Base.establish_connection(development_database_config)
set :database_file, 'database.yml'

require 'rack-flash'

require './app/controllers/application_controller'
require_all 'app'
