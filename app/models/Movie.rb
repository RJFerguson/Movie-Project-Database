class Movie < ActiveRecord::Base
  belongs_to :director
  belongs_to :genre
  has_many :appearances 
  has_many :actors, through: :appearances

end
