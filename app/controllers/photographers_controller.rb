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

    def canon
       # byebug
        @photographers = Photographer.canon
       # @photographers = Photographer.sony
       # byebug
       # redirect_to photographer_path
       render :canon 
    end 

    def sony 
        @photographers = Photographer.sony 
        render :sony 
    end 

    private 
    
    def photographer_params
        params.require(:photographer).permit(:name, :photographer_id, :search, :camera)
    end 




end 