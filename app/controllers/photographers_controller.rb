class PhotographersController < ApplicationController

    def index #if the user submits a search
        @photographers = Photographer.all       
        if params[:search] #then search thru the stuff we have already
            @photographers = @photographers.search(params[:search].downcase)
        end 
        # @photographers = Photographer.name.search(params[:search])
    end
    
    def show
        @photographer = Photographer.find_by_id(params[:id])
    end

    def photographer_camera
       # byebug
        @photographers = Photographer.canon
       # byebug
       # redirect_to photographer_path
       render :photographer_camera 
    end 

    private 
    
    def photographer_params
        params.require(:photographer).permit(:name, :photographer_id, :search, :camera)
    end 




end 