class MoviesController < ApplicationController
  before_action :require_login, except: %i[index show]
  before_action :require_admin, except: %i[index show]
  before_action :set_movie, only: %i[show edit update destroy]
  def index
    @movies = case params[:filter]
              when 'released'
                Movie.released
              when 'free'
                Movie.free
              when 'recent'
                Movie.recent
              else
                Movie.upcoming
              end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie), notice: 'Movie successfully created!'
    else
      render :new
    end
  end

  def show
    @likers = @movie.likers
    @category = @movie.categories
    @commenter = Comment.where(movie_id: @movie.id)
    return unless current_user.present?
    @registered = current_user.registrations.find_by(movie_id: @movie.id)
    @liked = current_user.likes.find_by(movie_id: @movie.id)
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: 'Movie successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    if @movie.destroy
      redirect_to movies_path(@movies), notice: 'Movie successfully deleted!'
    else
      render :show
    end
  end

  private

  def set_movie
    @movie = Movie.find_by!(slug: params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :location, :description, :viewing_date, :price, :avatar, :capacity, category_ids: [])
  end
end
