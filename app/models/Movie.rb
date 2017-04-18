class Movie < ActiveRecord::Base
  belongs_to :actors
  belongs_to :directors
  belongs_to :genres
end
