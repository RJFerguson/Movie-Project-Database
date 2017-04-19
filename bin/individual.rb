def get_movie_from_user
    puts "What movie would you like to look at?"
    user_query = gets.chomp
end 

def get_user_interest
    puts "Ok, What information would you like to see?"
    puts "Options: Please enter the option number\n 1. Title, 2. Duration, 3. Gross\n 4. Plot Keywords, 5. Score, 6. IMDB Link\n 7. Director, 8. Genre 9. Special"
    user_interest = gets.chomp 
end 
