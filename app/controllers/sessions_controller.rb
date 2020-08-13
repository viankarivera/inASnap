class SessionsController < ApplicationController
   # before_action :redirect_logged_in, except: [:destroy]

    def new
        @user = User.new 
        #login view
    end 

    def create
        #byebug
       @user = User.find_by_username(params[:username])
        if @user == nil || @user.authenticate(params[:password]) == false
            flash[:message] = "User not found."
            redirect_to login_path
        else
            session[:user_id] = @user.id
            redirect_to photographers_path(@user)
           # byebug
        
        end 
        #processes form
        #find user, authenticate passwrod set the session
    end 

    def destroy
        session.clear 
        redirect_to welcome_path
    end 


end 