class Actor < ActiveRecord::Base
  has_many :appearances
  has_many :movies, through: :appearances
  has_many :directors, through: :movies 
  has_many :genres, through: :movies
end
