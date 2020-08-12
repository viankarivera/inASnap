module ApplicationHelper


    def redirect_logged_in 
        redirect_to users_path(current_user) if logged_in?
    end 

    def redirect_logged_out 
        redirect_to welcome_path unless logged_in?
    end 


   
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        end 
    end 

    def logged_in?
        !!session[:user_id]
    end 
    
end
