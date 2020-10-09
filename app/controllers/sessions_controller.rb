class SessionsController < ApplicationController
   # before_action :redirect_logged_in, except: [:destroy]

    def new
        @user = User.new 
        #login view
    end 

    def create
        if params[:username]
        @user = User.find_by_username(params[:username])
            if @user == nil || @user.authenticate(params[:password]) == false
                flash[:message] = "User not found."
                redirect_to login_path
            else
                session[:user_id] = @user.id
                redirect_to photographers_path(@user)
            # byebug
            
            end
        else
            byebug
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
              end
            #byebug 
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