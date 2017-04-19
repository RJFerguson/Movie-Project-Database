class Genre < ActiveRecord::Base
  has_many :moviegenres
  has_many :movies, through: :moviegenres
  has_many :directors, through: :movies
  has_many :actors, through: :movies

end
