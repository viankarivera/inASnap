class ApplicationController < ActionController::Base 
    include ApplicationRecord::SessionsHelper 
    before_action :current_user 
     
    def home

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


