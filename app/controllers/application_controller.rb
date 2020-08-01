class ApplicationController < ActionController::Base 
    helper_method :current_user
    #helper_method :is_logged_in?, :current_user 
    def home

    end 

    def current_user
        if session[:current_user_id]
            @current_user = User.find(session[:current_user_id])
        end 
    end 

    def login(user)
        session[:current_user_id] = @user.id 
    end 

end 

    #private

     #   def require_login 
      #      unless logged_in?
       #         flash[:error] = "Please Log In to access photoshoots."

        #        redirect_to new_login_url
         #   end 
        #end 

        #def is_logged_in?
         #   !!session[:user_id]
        #end 

        #def current_user
         #   @current_user ||= User.find_by_id(session[:user_id])
        #end 


