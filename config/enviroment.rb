require 'bundler'
Bundler.require
require 'sqlite3'

# require_relative "../db/seed.rb"
# require_relative "../lib/queries.rb"

# Setup a DB connection here
@db_connection = SQLite3::Database.new(':memory:')

@db_connection.execute("CREATE TABLE IF NOT EXISTS shows (id INTEGER PRIMARY KEY, year INTEGER, occupation TEXT, show TEXT, group_show TEXT, guest TEXT)")
