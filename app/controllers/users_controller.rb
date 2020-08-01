class UsersController < ApplicationController
    #skip_before_action :require_login, only: [:index, :new, :create]

    #Get/signup
    def new
        @user = User.new 
        if session[:current_user_id]
            redirect_to "/", :notice => "You're already Logged In."
        end 
        #@users = User.new 
    end 

    def create #post/signup
      @user = User.new
      @user.email = params[:email]
      @user.save

      redirect_to "/login"
    end



end 