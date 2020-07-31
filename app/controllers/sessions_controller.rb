class SessionsController < ApplicationController
    before_action

    def new
        @user = User.new 
    end 
end 