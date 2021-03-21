class CLI

    def run
        puts""
        puts "TOP BOX OFFICE MOVIES(US)".blue.center(140).bold
        puts "Weekend of March 19 - 21, 2021".blue.center(140).bold
        puts""
        Scraper.scrape_movies
        list_movies
        menu
    end

    def list_movies
        Movie.all.each.with_index(1) do |mov, i|
        puts "#{i}. #{mov.name}".center(125)
        end
    end

    def menu
        puts""
        puts "Please select a number to get the movie details.".cyan.center(140).bold
        input = gets.chomp
        if !input.to_i.between?(1, Movie.all.count)
            puts""
            puts "Movie not found. Please select a different number.".red.center(140)
            puts""
            list_movies
            menu
        else 
            movies = Movie.all[input.to_i-1]
            display_movie_details(movies) 
        end
    end

        def display_movie_details(movie)
            Scraper.scrape_ind_movies(movie)
            puts "Here are the details for #{movie.name}:".center(130).cyan
            puts""

            puts "Ratings: #{movie.rating}".center(130)
            puts "Genre: #{movie.genre}".center(130)
            puts""
            puts "Description:#{movie.description}".center(130)
            puts""
            puts "For more information visit: www.imdb.com#{movie.url}".center(130)
            puts""
            puts "Type 0 to go back to the movie list or type exit.".center(130).cyan.bold
            input = gets.chomp
            if input == "0"
                list_movies
                menu.center(140)
            else 
                input == "EXIT" || "exit" || "Exit"
                exit
            end
        end       
 
end
