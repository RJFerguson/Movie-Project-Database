require_relative '../config/environment'
require_relative 'meta.rb'
require_relative 'individual.rb'
require_relative 'game.rb'
require_relative 'search.rb'

def greet
    first_string = "Hello! Welcome to our Command Line Movie Database"
    first_string.each_char do |x|
        print x
        sleep(0.02)
    end 
    puts "\n"
    second_string = "In this application you can look at over 5000 movies and their stats"
    second_string.each_char do |x|
        print x
        sleep(0.02)
    end 
    puts "\n"
end

def meta_or_individual
    puts "Would you like to look at metadata or an individual movie?"
    puts "Please choose a number:\n1. Metadata 2. Individual 3. Game 4. Search"

    check = gets.chomp
    if check == '1' || check == '2' || check == '3' || check == '4'
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
elsif user_response == 3 
    DecisionTreeGame.new()
else
    Searchomdb.new()
end
