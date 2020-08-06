class UsersController < ApplicationController

    def new
        @user = User.new #get signup
    end 

    def create #post signup
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to photographers_path
        else
            render :new 
        end 

       # byebug
    end 

    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end 
end 