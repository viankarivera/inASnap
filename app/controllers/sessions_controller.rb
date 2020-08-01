class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end 

    def create
        @user = User.find_by(:email => params[:email])
        if @user
            login(@user)
            redirect_to "/"
        else
            redirect_to "/login", notice: "User not found."
            render :new 
        end 
    end 

    def destroy
        reset_session
        redirect_to root_path
    end 
end 