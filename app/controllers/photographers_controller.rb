class PhotographersController < ApplicationController

    def index
        if params[:search]
            @photographer = Photographer.search(params[:search])
        else 
         @photographers = Photographer.all 
        end 
        
    end
    
    def show
        @photographer = Photographer.find_by_id(params[:id])
    end

    private 
    
    def photographer_params
        params.require(:photgrapher).permit(:name, :photographer_id, :search)
    end 




end 