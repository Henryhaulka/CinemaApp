class UsersController < ApplicationController
    def index
        @user = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to movies_path, notice: 'Welcome, You have successfully created an account'
        else
            render :new
        end
    end
    
    private
    def user_params
       params.require(:user).permit(:name,:email, :password, :password_confirmation) 
    end
    
    
end