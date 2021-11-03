module MoviesHelper
    def price(movie)
        if movie.price == 0
            "Free"
        else
            number_to_currency(movie.price, precision: 0)
        end
    end
end
