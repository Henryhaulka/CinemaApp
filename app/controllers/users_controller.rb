class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]
  before_action :require_correct_user, only: %i[edit update destroy]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @registered = @user.registrations
    @liked_movies = @user.liked_movies
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have Successfully updated your Account info'
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # This line automatically sign in a user if they signed up
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome #{@user.name}, You have successfully created an account"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # This line ensures when your account is deleted, your session also gets deleted
    # IF NOT IMPLEMENTED, AN ID ERROR WILL POP
    session[:user_id] = nil
    redirect_to root_path, alert: 'Account Deleted Successfully!!'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to root_path, notice: 'You are not Authorized' unless correct_user?(@user)
  end
end
