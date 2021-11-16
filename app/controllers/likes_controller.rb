class LikesController < ApplicationController
    before_action :require_login
    def create
        movie = Movie.find_by!(slug: params[:movie_id])
        movie.likes.create!(user: current_user)
        redirect_to movie_path(movie),notice: "Thank you for add #{movie.name} to your favourites \u{270c}"
    end

    def destroy
        liked = current_user.likes.find(params[:id])
        liked.destroy
        movie = Movie.find_by!(slug: params[:movie_id])
        redirect_to movies_path, alert: "You have removed #{movie.name} from your Favourite list \u{1f44e}"
    end
    
end
