class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :appearances
  has_many :moviegenres
  has_many :genres, through: :moviegenres
  has_many :actors, through: :appearances


  def self.average_score(arr)
    sum = 0
    counter = 0
    arr = self.all
    arr.each do |movie|
      sum+= movie.score
      counter+=1
    end
    sum / counter
  end

  def self.shorter_than (length)
    movies = []
    self.all.each do |movie|
      if movie.duration < length
      movies << movie
      end
    end
    movies
  end

  def self.average_score_by_director(director)
    director.downcase!
    sum = 0
    counter = 0
    arr = self.all
    arr.each do |movie|
      if (movie.director.name.downcase == director)
      sum+= movie.score
      counter+=1
      end
    end
    sum / counter
  end



  def self.movies_with_genre (genre)
    all = self.all
    movies = []
    all.each do |movie|
      genres = movie.genres.collect do |genre|
        genre.name.downcase
      end
      if genres
        movies << movie
      end
    end
    movies
  end
  #   sum = 0
  #   movies.each do |movie|
  #     sum += movie.score
  #   end
  #   sum /= movies.length
  # end

  def self.cast_and_crew (title)
      ans = "Actors: "
      movie = self.find_by(title: title)
        if movie == nil
          return "No Matches"
        end
      movie.actors.each do |actor|
        ans += "#{actor.name} "
      end
      ans += "Director: " + movie.director.name
  end


  def includes_person? (person)
    person.downcase!
    names = self.actors.map {|actors| actors.name.downcase}
    names << self.director.name.downcase
    if names.length != 0
      return names.index(person) > -1 ? true : false
    else
      false
    end
  end


 def self.movies_above_score(num) 
    arr = [] 
    self.where("score > #{num}").collect do |x|
      arr << [x.title, x.score] 
    end  
    return arr 
  end

end
