class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :appearances
  has_many :moviegenres
  has_many :genres, through: :moviegenres
  has_many :actors, through: :appearances


  def self.average_score
    average(:score).to_f
  end

  def self.good_movies
    where("score > 8.0")
  end

  def self.bad_movies
    where("score < 6.0")
  end

  def self.x_best_movies (num)
    order(score: :desc).limit(num)
  end

  def self.x_worst_movies (num)
    order(score: :asc).limit(num)
  end

  def self.shorter_than (length)
    movies = []
    self.all.each do |movie|
      if movie.duration / 1 != 0 && movie.duration < length
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


  def self.with_genre (genre)
    all = self.all
    ans = []
    all.each do |movie|
      movie.genres.each do |x|
        if x.name.downcase == genre.downcase
          ans << movie
        end
      end
  end
    ans
  end

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

 def self.movies_above_score(num)
    arr = []
    self.where("score > #{num}").collect do |x|
      arr << [x.title, x.score]
    end
    return arr
  end

  def self.so_much_plot (word)
    self.all.select  do |m|
      m.plot_keywords.include? word
      end
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



end
