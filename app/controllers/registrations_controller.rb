class RegistrationsController < ApplicationController
    def index
       @movie = Movie.find(params[:movie_id])
       @registration = @movie.registrations
    end
end
