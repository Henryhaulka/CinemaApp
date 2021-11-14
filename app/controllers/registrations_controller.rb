class RegistrationsController < ApplicationController
  before_action :require_login
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
    @registration.user = current_user
    if @registration.save
      redirect_to movie_registrations_path(@movie), notice: "Thank you for registering! \u{1f917}"
    else
      render :new
    end
  end

  def destroy
     registered = current_user.registrations.find(params[:id])
     registered.destroy
     movie = Movie.find(params[:movie_id])
     redirect_to movie_path(movie), alert: "You have successfully cancel your registration for #{movie.name} \u{1f62a}"
  end

  private

  def reg_params
    params.require(:registration).permit(:heard)
  end
end
