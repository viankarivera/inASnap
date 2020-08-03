class UsersController < ApplicationController
    before_action :redirect_for_logged_in

    #Get/signup

    def index 
        @users = User.all 
    end 

    def new
        @user = User.new 
    end 

    def create #post/signup
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            render :new 
        end 
    end

    def show
        @user = User.find_by_id(params[:id])
        @photoshoot = @user.photoshoots.build(photoshoots_params)
        @location = @user.locations.build(location_params)
    end 

    def destroy
        User.find(session[:user_id]).destroy 
        session[:user_id] = nil 
        redirect_to root_path 
    end 

    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :user_id)
    end 

    def photoshoot_params 
        params.require(:photoshoot).permit(:client, :location, :price)
    end 

    def location_params 
        params.require(:location).permit(:name, :client_id, :price)
    end 



end 