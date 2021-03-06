require 'bundler'
# require 'sqlite3'
# require 'active_record'
# require 'rake'
# require 'rest-client'
# require 'json'
# require 'pry'

# require 'bundler/setup'
# require "sinatra/activerecord"
Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)
ActiveRecord::Base.logger = nil 

# require_all 'app'
