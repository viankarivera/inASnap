class LocationsController < ApplicationRecord
    before_action :set_user 

    def index
        @locations = Location.search(params[:query], @user)
    end 

    def new 
        @location = Location.new 
    end 

    def create 
        @location = current_user.locations.build(lcoation_params)
        if @lcoation.save
            redirect_to user_location_path(current_user)
        else
            render :new 
        end 
    end 

    def edit 
        redirect_to user_locations_path(current_user) unless current_user == @user 
    end 

    def update 
        if @location.update(photoshoot_params)
            redirect_to user_photoshoots_path(@location)
        else 
            render :edit 
        end 
    end 

    def show 
        set_location
        @photoshoots = @location.photoshoot 
    end 

    def destroy
        @location.destroy 
        redirect_to user_photoshoots_path 
    end 

    private 

    def set_user 
        @user = User.find_by_id(params[:user_id])
    end 

    def set_location 
        @location = Location.find_by_id(params[:id])
    end 

    def set_photoshoot
        @photoshoot = Photoshoot.find_by_id(params[:id])
    end 

    def location_params 
        params.require(:room).permit(:name, :photoshoot_id, :price)
    end 

end 