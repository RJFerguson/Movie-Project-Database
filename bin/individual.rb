class IndividualMovie
    attr_accessor :movie, :info

     def initialize 
        @movie = self.get_movie_from_user
        clean_display(movie) 
    end 

    def get_movie_from_user
        first_string = "What movie would you like to look at?"
        first_string.each_char do |x|
            print x
            sleep(0.02)
        end 
        puts "\n"
        movie = gets.chomp
        check_movie_title(movie)
    end 

    def check_movie_title(movie)
        movie = Movie.find_by(title: movie)
        if movie == nil 
            puts "Sorry we can't find that movie, try again"
            get_movie_from_user
        else 
            return movie 
        end 
    end 

    def clean_display(movie) 
        puts "Title: #{movie.title} | Duration: #{movie.duration} Minutes\nDirector: #{movie.director.name} | Main Actors: #{movie.actors.collect{|x|x.name}.join(", ")}\nUS Gross: #{movie.gross} Dollars | Plot Keywords: #{movie.plot_keywords.split("|").join(", ")}\nIMDB Score: #{movie.score} | IMDB Link: #{movie.imdb_link}"
        redo_search? 
    end

    def redo_search?
        puts "*" * 30 
        puts "Great! Would you like to look at another Movie? (Y/n)"
        user_input = gets.chomp 

        if user_input == "Y" || user_input == "y" 
            IndividualMovie.new()
        else 
            puts "Goodbye!"
        end 
    end  
end 


