class PhotographersController < ApplicationController

    def index
        @photographers = Photographer.all
    end
    
    def show
        @photographer = Photographer.find_by_id(params[:id])
    end 



end 