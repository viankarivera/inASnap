class ApplicationController < ActionController::Base 
    before_action :require_login
    helper_method :is_logged_in?, :current_user 

    private

        def require_login 
            unless logged_in?
                flash[:error] = "Please Log In to access photoshoots."

                redirect_to new_login_url
            end 
        end 

        def is_logged_in?
            !!session[:user_id]
        end 

        def current_user
            @current_user ||= User.find_by_id(session[:user_id])
        end 

end
