class SessionsController < ApplicationController
    
    def new
    end 

    def create
        @user = User.find_by(:email => params[:email])
        if @user
            raise "login".inspect
        else
            redirect_to "/login", notice: "User not found."
        end 
    end 
end 