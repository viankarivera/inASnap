class SessionsController < ApplicationController
   # before_action :redirect_logged_in, except: [:destroy]

    def new
        @user = User.new 
        #login view
    end 

    def create
        #omniauth log in via facebook
        if auth = request.env['omniauth.auth']
            oauth_email = request.env['omniauth.auth']["email"]
        
            if user = User.find_by(:email => oauth_email)
                session[:user_id] = user.id

                redirect_to photographers_path
            else
                user = User.create(:email => oauth_email)
                session[:user_id] = user.id
                
                redirect_to photographers_path
            end 
        else
            @user = User.find_by_username(params[:username])
            if @user == nil || @user.authenticate(params[:password]) == false
                flash[:message] = "User not found."
                redirect_to login_path
            else
                session[:user_id] = @user.id
                redirect_to photographers_path(@user)
                # byebug
                
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