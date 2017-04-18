require 'csv'
require "sqlite3"
require "pry"


Director.delete_all

csv_text = File.read('./movie_metadata.csv')

if ! csv_text.valid_encoding?
  csv_text = csv_text.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
end

parsed_text = CSV.parse(csv_text)


parsed_text.each do |row|
      Director.create(:name=>row[0])
end
