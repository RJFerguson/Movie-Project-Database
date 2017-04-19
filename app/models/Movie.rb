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
