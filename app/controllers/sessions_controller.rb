class SessionsController < ApplicationController
   # before_action :redirect_logged_in, except: [:destroy]
    skip_before_action :verify_authenticity_token, only: :create 

    def new
       # @user = User.new 
        #login view
    end 

    def create #omniauth log in
        #byebug
        if request.env['omniauth.auth']
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id 
            redirect_to photographers_path(@user)
             
        else #regular log in
            @user = User.find_by_username(params[:username])
                if @user == nil || @user.authenticate(params[:password]) == false
                flash[:message] = "User not found."
                redirect_to login_path

                else

                session[:user_id] = @user.id
                redirect_to photographers_path(@user)

                end
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