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
        @review = Review.new
    end 

    def create 
        @review = Review.new(review_params)
        @review.user_id = current_user.id 
        #@review.photographer_id = @photographer.id 
        if @review.save
            redirect_to reviews_path 
        else 
            render :new 
        end 
    end 

    def edit
        @review = Review.find_by_id(params[:id])
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