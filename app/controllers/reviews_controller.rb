class ReviewsController < ApplicationController

    def index
        @reviews = Review.all 
    end 

    def show 
        if @review.user_id == current_user.id 
            render :show 
        else 
            redirect_to reviews_path 
        end 
    end 
       

    def new
       # byebug
        @review = Review.new(photographer_id: params[:photographer_id])
        
        #@photographer.id = Photographer.find_by_id(params[:id])
    end 

    def create 
        @review = Review.create(review_params)
        @review.user_id = current_user.id 
        #@review.photographer_id = @photographer.id
        if @review.save
            redirect_to reviews_path 
        else 
            render :new 
        end 
    end 

    def edit
        if @review.user_id == current_user.id 
            render :edit 
        else 
            redirect_to reviews_path(@review)
        end 
    end 

    def update 
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to reviews_path(@review)
    end 


    private

    def review_params 
        params.require(:review).permit(:comment)
    end 

end 