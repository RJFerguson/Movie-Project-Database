# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
# require_relative "../config/environment.rb"
# require_relative "../lib/queries.rb"
require 'csv'    
require "sqlite3"
require "pry"

# tester = CSV.read('##')

# tester.shift

# check = tester.zip(tester['YEAR'],tester['GoogleKnowlege_Occupation'],tester['Show'],tester['Group'],tester['Raw_Guest_List'])

# binding.pry
# tester.each do |row|
#     @db_connection.execute("INSERT INTO shows (year, occupation, show, group_show, guest) VALUES (?, ?, ?, ?, ?)", row[0].to_i, row[1], row[2], row[3], row[4])
# end 