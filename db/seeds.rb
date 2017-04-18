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

# def initialmethod
#     require 'csv'

# csv_text = File.read('./movie_metadata.csv')
#
# if ! csv_text.valid_encoding?
#   csv_text = csv_text.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
# end
#
# parsed_text = CSV.parse(csv_text)
#
# parsed_text.each do |row|
#       @db_connection.execute("INSERT INTO Directors (director_name) VALUES (?)", row[0])
# end
# binding.pry
#
# # end
