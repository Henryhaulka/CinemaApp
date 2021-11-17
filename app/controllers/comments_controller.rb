class CommentsController < ApplicationController
    before_action :require_login, except: %i[index show]
    def create
      if current_user
        @movie = Movie.find_by!(slug: params[:movie_id])
        @movie.comments.create!(comment_params)
        redirect_to movie_path(@movie), notice: 'Thanks for your comment'
      end
    end

    def destroy
        movie = Movie.find_by!(slug: params[:movie_id])
        comment = movie.comments.find_by(user_id: current_user.id)
        comment.destroy
        redirect_to movie_path(movie), alert: 'Comment successfully deleted'
    end
    
    private
    def comment_params
       params.require(:comment).permit(:body, :user_id)
    end
    
    
end