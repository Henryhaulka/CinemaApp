class MoviesController < ApplicationController
  def index
    @movies = %w[Acrimony Superfly Swallow]
  end
end
