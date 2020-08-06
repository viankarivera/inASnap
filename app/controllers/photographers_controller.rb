class PhotographersController < ApplicationController

    def index
        @photographers = Photographer.all
    end  

end 