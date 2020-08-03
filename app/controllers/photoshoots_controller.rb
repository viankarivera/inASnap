class PhotoshootsController < ApplicationController
    before_action :redirect_for_logged_out
    before_action :set_user
    before_action :set_location, only: [:create]
    
    
    def index
        @photoshoots = Photoshoot.search(params[:query], @user)
    end 

    def new
        @photoshoot = Photoshoot.new 
        set_location 
    end 

    def create 
        @photoshoot = current_user.photoshoots.build(photoshoot_params)
        if @photoshoot.save
            redirect_to user_photoshoots_path(current_user)
        else 
            flash[:alert] = @photoshoot.errors.full_messages.join(", ")
            render :new 
        end 
    end 

    def show 
        set_user 
        set_location 
    end 

    def edit
        redirect_to user_photoshoots_path(current_user) unless current_user == @user 
    end 

    def update
        if @photoshoot.update(photoshoot_params)
            redirect_to user_photoshoot_path(@photoshoot)
        else
            render :edit 
        end
    end 

    def destroy
        @photoshoot.destroy 
        redirect_to user_photoshoots_path 
    end 

    private

    def set_user 
        @user = User.find_by_id(params[:user_id])
    end 

    def set_location 
        @location = Location.find_by_id(params[:id])
    end 

    def photoshoot_params 
        params.require(:photoshoot).permit(:client, :location, :price, :user_id, :client_id)
    end 
    
end 