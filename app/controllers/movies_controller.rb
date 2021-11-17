class MoviesController < ApplicationController
  before_action :require_login, except: %i[index show]
  before_action :require_admin, except: %i[index show]
  before_action :set_movie, only: [:show,:edit,:update, :destroy]
  def index
    case params[:filter]
    when 'released'
      @movies = Movie.released
    when 'free'
      @movies = Movie.free
    when 'recent'
      @movies = Movie.recent
    else
      @movies = Movie.upcoming
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
    @commenter = @movie.commenters
    if current_user.present?
      @registered = current_user.registrations.find_by(movie_id: @movie.id)
      @liked = current_user.likes.find_by(movie_id: @movie.id)
    end
  end

  def edit
  end

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
