class UsersController < ApplicationController
    #skip_before_action :require_login, only: [:index, :new, :create]

    #Get/signup
    def new
        #@users = User.new 
    end 

    def create #post/signup
      @user = User.new
      @user.email = params[:email]
      @user.save

      redirect_to "/login"
    end

    def index
        @users = User.all  
    end 


end 