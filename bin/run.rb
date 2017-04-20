require_relative '../config/environment'
require_relative 'meta.rb'
require_relative 'individual.rb'
require_relative 'game.rb'
require 'pry'

def greet
    puts "Hello! Welcome to out Command Line Movie Database"
    puts "In this application you can look at over 5000 movies and their stats"
    puts ""
end

def meta_or_individual
    puts "Would you like to look at metadata or an individual movie?"
    puts "Please choose a number:\n1. Metadata 2. Individual 3. Game"

    check = gets.chomp
    if check == '1' || check == '2' || check == '3'
        return check.to_i
    else
        meta_or_individual
    end
end

greet
user_response = meta_or_individual

if user_response == 1
    Meta_methods.new()
elsif user_response == 2
    IndividualMovie.new()
else
    DecisionTreeGame.new()
end
