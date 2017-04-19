require_relative '../config/environment'
require_relative 'meta.rb'
require_relative 'individual.rb'

def greet 
    puts "Hello! Welcome to out Command Line Movie Database"
    puts "In this application you can look at over 5000 movies and their stats"
    puts ""
end  

def meta_or_individual 
    puts "Would you like to look at metadata or an individual movie?"
    puts "Please choose a number: \n 1. Metadata 2. Individual"
    meta_or_individual = gets.chomp 
end 


greet 
meta_or_individual
get_movie_from_user
get_user_interest


# puts " IMDB Score: #{check.find_by(title: user_query).score}"



