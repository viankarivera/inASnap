class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create 

    def new
       @user = User.new 
        #login view
    end

    def omniauth 
       # request.env['omniauth.auth']
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id 
            redirect_to photographer_path(@user)
    end 

    def create #omniauth log in
        
             #regular log in
            @user = User.find_by_username(params[:username])
                if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to photographers_path(@user)

                else

                    flash[:message] = "User not found."
                    redirect_to login_path

                end
            
    end 


    def destroy
        session.clear 
        redirect_to welcome_path
    end 

    private

    def auth 
        request.env['omniauth.auth']
    end 


end 