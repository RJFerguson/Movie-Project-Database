class String
  def is_integer?
    self.to_i.to_s == self
  end
end

class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :appearances
  has_many :moviegenres
  has_many :genres, through: :moviegenres
  has_many :actors, through: :appearances
  nums = []

  def self.average_score
    average(:score).to_f
  end

  def self.good_movies
    good = where("score > 8.0").collect do |movie|
      movie.title + " " + movie.score.to_s
    end
    good.compact
  end

  def self.bad_movies
    bad = where("score < 6.0").collect do |movie|
      movie.title + " " + movie.score.to_s
    end
    bad.compact
  end

  def self.x_best_movies_1(num)
    if num.is_integer?
      best = order(score: :desc).limit(num).collect do |movie|
        movie.title + " " + movie.score.to_s
      end
      best.compact
    else
      return "Not Valid"
    end
  end

  def self.x_worst_movies_1 (num)
    if num.is_integer?
      worst = order(score: :asc).limit(num).collect do |movie|
        movie.title + " " + movie.score.to_s
      end
      worst.compact
    else
      return "Not valid"
    end
  end

  def self.shorter_than_1(length)
    if length.is_integer?
      movies = []
      self.all.each do |movie|
        if movie.duration / 1 != 0 && movie.duration < length.to_i
          movies << movie
        end
      end
      shorter = movies.collect do |movie|
        movie.title + " " + movie.duration.to_s
      end
      shorter.compact
    else
      return "Not valid"
    end
  end

  def self.average_score_by_director_1(director)
    if director.is_integer? == false
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
    else
      return "Not valid"
    end
  end


  def self.with_genre_1(genre)
    if genre.is_integer? == false
    all = self.all
    ans = []
    all.each do |movie|
      movie.genres.each do |x|
        if x.name.downcase == genre.downcase
          ans << movie
        end
      end
    end
    with = ans.collect do |movie|
      movie.title
    end
      with.compact
    else
    return "Not valid"
    end
  end

  # def self.cast_and_crew_1 (title)
  #     ans = "Actors: "
  #     movie = self.find_by(title: title)
  #       if movie == nil
  #         return "No Matches"
  #       end
  #     movie.actors.each do |actor|
  #       ans += "#{actor.name} "
  #     end
  #     ans += "Director: " + movie.director.name
  # end

 def self.movies_above_score_1(num)
   if num.is_integer?
    arr = []
    self.where("score > #{num}").collect do |x|
      arr << [x.title, x.score]
    end
    if arr.length == 0
      return "No Matches"
    end
    else
      return "Not Valid"
    end
  end
 end
