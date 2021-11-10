class ApplicationController < ActionController::Base
    #putting this in application controller makes it avaliable to all controllers
    #making it private make it accessable to only and oly controllers ,not routes

    private
    def current_user
       User.find(session[:user_id]) if (session[:user_id])
    end

    #converting a method to a view helper
    helper_method :current_user

    def require_login
      unless current_user
        session[:intended_url] = request.url
        redirect_to new_session_path, alert: 'Please, Sign in first'
      end
   end
   
   def correct_user?(user)
       current_user == user
   end
   
   helper_method :correct_user?

   def require_admin
        redirect_to movies_path, alert: 'Unauthorized Access!!' unless current_user.admin?
   end
   
   def current_user_admin?
      current_user && current_user.admin?
   end

   helper_method :current_user_admin?
   
    
end
