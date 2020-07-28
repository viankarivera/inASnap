class ApplicationController < ActionController::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        use Rack::Session::Cookie
        set :session_secret, "photo"
    end 

    helpers do 
        def is_logged_in?
            !!session[:user_id]
        end 

        def current_user
            @current_user ||=User.find_by_id(session[:user_id])
        end 
    end 
end
