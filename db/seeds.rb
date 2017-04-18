require 'csv'
require "sqlite3"
require "pry"


Director.delete_all
Movie.delete_all
Actor.delete_all
Genre.delete_all

csv_text = File.read('./test_data.csv', :headers => true)

if ! csv_text.valid_encoding?
  csv_text = csv_text.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
end

parsed_text = CSV.parse(csv_text)


  parsed_text.each do |column|
      Director.create(:name=>column[0])
      Movie.create(:duration=>column[1],:gross=>column[3], :title=>column[6], :plot_keywords => column[8], :imdb_link => column[9], :score => column[11])
      Actor.create(:name=>column[2])
      Actor.create(:name=>column[5])
      Actor.create(:name=>column[7])
      Genre.create(:name=>column[4])

end
