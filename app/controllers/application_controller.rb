class ApplicationController < ActionController::Base 

    helper_method :is_logged_in?, :current_user 

    private

        def is_logged_in?
            !!session[:user_id]
        end 

        def current_user
            @current_user ||=Photographer.find_by_id(session[:user_id])
        end 

end
