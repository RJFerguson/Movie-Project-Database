class Director < ActiveRecord::Base
  has_many :movies
  has_many :genres, through: :movies
  has_many :actors, through: :movies

  def self.movies_above_score(num) 
    arr = []
    arr2 = [] 
   query =  "SELECT directors.name, movies.title FROM movies 
            JOIN directors on movies.director_id = directors.id
            WHERE movies.score > #{num}"
    arr << (self.find_by_sql(query))
    arr[0].collect do |x|
      arr2 << x.name
    end 
    arr2.uniq 
  end 
end
