class SessionsController < ApplicationController
   # before_action :redirect_logged_in, except: [:destroy]

    def new
       # @user = User.new 
        #login view
    end 

    def create #omniauth log in
        #byebug
        if auth_hash = request.env['omniauth.auth']
            
           oauth_email = request.env['omniauth.auth']['info']['email']
            if @user = User.find_by(:email => oauth_email)
                session[:user_id] = @user.id

               # redirect_to photographers_path
            else
              # byebug
                @user = User.create(:email => oauth_email, :password => SecureRandom.hex)
                @user.save
                session[:user_id] = @user.id
               # byebug
               # redirect_to photographers_path
            end 

        else #regular log in
          # byebug
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