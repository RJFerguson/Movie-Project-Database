require_relative '../config/environment'
require_relative 'meta.rb'
require_relative 'individual.rb'
require 'pry'

def greet 
    puts "Hello! Welcome to out Command Line Movie Database"
    puts "In this application you can look at over 5000 movies and their stats"
    puts ""
end  

def meta_or_individual 
    puts "Would you like to look at metadata or an individual movie?"
    puts "Please choose a number: \n 1. Metadata 2. Individual"
    
    check = gets.chomp
    if check == '1' || check == '2'
        return check.to_i 
    else 
        meta_or_individual
    end  
end 

greet 

if meta_or_individual == 1 
    meta_methods 
else 
    IndividualMovie.new()
end 









