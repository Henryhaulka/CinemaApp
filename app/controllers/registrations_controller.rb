class RegistrationsController < ApplicationController
  before_action :require_login
  before_action :set_movie

  def index
    @registration = @movie.registrations
  end

  def new
    @registration = @movie.registrations.new
  end

  def create
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
    movie = Movie.find_by!(slug: params[:movie_id])
    redirect_to movie_path(movie), alert: "You have successfully cancel your registration for #{movie.name} \u{1f62a}"
  end

  private

  def set_movie
    @movie = Movie.find_by(slug: params[:movie_id])
  end

  def reg_params
    params.require(:registration).permit(:heard)
  end
end
