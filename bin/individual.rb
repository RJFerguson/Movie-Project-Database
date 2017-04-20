
require 'pry'
class IndividualMovie
    attr_accessor :movie, :info

     def initialize 
        self.get_movie_from_user
        self.check_movie_title(movie)
        self.get_user_interest
    end 

    def get_movie_from_user
        puts "What movie would you like to look at?"
        movie = gets.chomp
        check_movie_title(movie)
    end 

    def get_user_interest
        puts "Ok, What information would you like to see?"
        puts "Options: Please enter the option number\n 1. Title, 2. Duration, 3. Gross\n 4. Plot Keywords, 5. Score, 6. IMDB Link\n 7. Director, 8. Genre 9. all"
        user_interest = gets.chomp 
    end 
 

    def check_movie_title(movie)
        movie = Movie.find_by(title: movie)
        if movie == nil 
            puts "Sorry we can't find that movie, try again"
            get_movie_from_user
        else 
            return movie 
        end 
        movie 
    end 
end 

def get_movie_from_user
    puts "What movie would you like to look at?"
    user_query = gets.chomp
end

def get_user_interest
    puts "Ok, What information would you like to see?"
    puts "Options: Please enter the option number\n 1. Title, 2. Duration, 3. Gross\n 4. Plot Keywords, 5. Score, 6. IMDB Link\n 7. Director, 8. Genre 9. Special"
    user_interest = gets.chomp
end 

