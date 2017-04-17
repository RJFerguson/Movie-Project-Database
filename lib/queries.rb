# Write methods that return SQL queries for each part of the challeng here
require_relative "../config/environment.rb"
require_relative "../db/seed.rb"


def guest_with_most_appearances
  @db_connection.execute("SELECT shows.guest, COUNT(shows.guest) FROM shows GROUP BY shows.guest ORDER BY COUNT(shows.guest) DESC LIMIT 1")
end