require 'csv'
require "sqlite3"
require "pry"


Director.delete_all
Movie.delete_all
Actor.delete_all
Genre.delete_all

csv_text = File.read('./movie_metadata_clean.csv', :headers => true)

if ! csv_text.valid_encoding?
  csv_text = csv_text.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
end

parsed_text = CSV.parse(csv_text)
parsed_text.shift
parsed_text
parsed_text.each do |column|
  director = Director.find_or_create_by(:name=>column[0])
  actor = Actor.find_or_create_by(:name=>column[2])
  actor2 = Actor.find_or_create_by(:name=>column[5])
  actor3 = Actor.find_or_create_by(:name=>column[7])
  col = column[4].split('|')
  final = col.collect do |genre|
    Genre.find_or_create_by(:name => genre)
  end
  final = final.map do |genre|
    genre.id
  end
  # genre = Genre.find_or_create_by(:name=>)
  Movie.create(:duration=>column[1],:gross=>column[3], :title=>column[6], :plot_keywords => column[8], :imdb_link => column[9], :score => column[11], :genre_ids => final, :actor_ids => [actor.id,actor2.id,actor3.id], :director_id => director.id)
end
