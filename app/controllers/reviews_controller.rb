class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
       # if params[:photographer_id]
        @reviews = Review.all 
    
    end 


    def new
       # if params[:photographer_id] || 
         @review = Review.new(current_user: params[:current_user_id])
         @review = @photographer.reviews.build 
     end 

     def create 
        @review = current_user.reviews.build(review_params)
        #@review.user_id = current_user.id 
        #@review.photographer_id = @photographer.id
        if @review.save
            redirect_to reviews_path 
        else 
            render :new 
        end 
    end 


    def show 
        if @review.user_id == current_user.id 
            render :show 
        else 
            redirect_to reviews_path 
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