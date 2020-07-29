class UsersController < ApplicationController
    before_action :require_logged_in

    def index
        @users = User.all  
    end 

    def new
        @user = User.new 
    end 

    def create
        user = User.new(user_params)
            if user.save
                session[:user_id] = user.id 
                redirect_to user_path(user)
            else 
                render :new 
            end 
    end

end 