class UsersController < ApplicationController
   # before_action :redirect_logged_in

    def index
        @users = User.all 
    end 

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

    def show 
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to login_path if !current_user 
    end 


    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end 
end 