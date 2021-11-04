module MoviesHelper
    def price(movie)
        if movie.nothing?
            "Free"
        elsif movie.zero?
             "Free"
        else
            number_to_currency(movie.price, precision: 0)
        end
    end

    def day_time(movie)
        movie.viewing_date.strftime("%a, %d %B %Y at %I:%M %P")
    end
    
end
