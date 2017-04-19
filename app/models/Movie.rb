class Movie < ActiveRecord::Base
  belongs_to :director
  belongs_to :genre
  has_many :appearances 
  has_many :actors, through: :appearances

  def self.movies_above_score(num) 
    arr = [] 
    self.where("score > #{num}").collect do |x|
      arr << [x.title, x.score] 
    end  
    return arr 
  end 


end
