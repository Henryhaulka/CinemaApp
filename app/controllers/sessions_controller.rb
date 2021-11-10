class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect_to user_path(user), notice: "Welcome back, #{user.name.upcase} \u{1f600}"
    else
      flash[:alert] = 'Invalid Password/Email Combination'
        render :new
    end
  end

  def destroy
  end
end
