class RegistrationsController < ApplicationController
    def index
       @movie = Movie.find(params[:movie_id])
       @registration = @movie.registrations
    end

    def new
        @movie = Movie.find(params[:movie_id])
        @registration = @movie.registrations.new
    end

    def create
        @movie = Movie.find(params[:movie_id])
        @registration = @movie.registrations.new(reg_params)
        if @registration.save
            redirect_to movie_registrations_path(@movie), notice: 'Thank you for registering!'
        else
            render :new
        end
    end
    private    
    def reg_params
        params.require(:registration).permit(:name,:email,:heard)
    end
    
end
