class Searchomdb
    
     def initialize
        puts "Welcome to search! You can search the OMDB database and get info based on what you type."
        ask_for_movie 
     end 

     def ask_for_movie
         puts "What movie are you looking for?"
         user_input = gets.chomp 
         search_term(user_input)
    end 

    def search_term(user_input)
        movie_info = RestClient.get("http://www.omdbapi.com/?t=#{user_input}&type=movie&plot=full")
        movie_hash = JSON.parse(movie_info)
        results(movie_hash)
    end 

    def results(movie_hash)
        puts "Title: #{movie_hash['Title']} | Year: #{movie_hash['Year']} | Director: #{movie_hash['Director']} | Actors: n#{movie_hash['Actors']}\n#{movie_hash['Plot']}"
        new_search?
    end 

    def new_search?
        puts "*" * 30 
        puts "Would you like to search again? (Y/n)"
        choice = gets.chomp 

        if choice == "Y" || choice == "y"
            ask_for_movie
        else 
            puts "Goodbye!"
        end 
    end 
end 