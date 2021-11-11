class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      #saving the user.id in a hash which will be use to track the user when signed in
       session[:user_id] = user.id
       redirect_to (session[:intended_url] || user), notice: "Welcome back, #{user.name.upcase} \u{1f600}"
         session[:intended_url] = nil
      else
      flash[:alert] = 'Invalid Password/Email Combination'
        render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Bye, You have Successfully signed out"
  end
end