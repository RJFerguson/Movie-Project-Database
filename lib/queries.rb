# Write methods that return SQL queries for each part of the challeng here
require_relative "../config/environment.rb"
require_relative "../db/seed.rb"


def self.directors
  Director.name.all
end
