class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @reviews = Review.all
    
    end 


    def new
        if params[:photographer_id]
        @review = Review.new(photographer_id: params[:photographer_id])
        else 
            @review = Review.new 
        end 

     end 

     def create 
        @review = current_user.reviews.build(review_params)
       # @review.user_id = current_user.id 
        #@review.photographer_id = @photographer.id
        if @review.save
            redirect_to reviews_path 
        else 
            render :new 
        end 
    end 


    def show
        @review = Review.find_by_id(params[:id])
        if @review.user_id == current_user.id 
            render :show 
        else 
            redirect_to reviews_path 
        end 
    end 
       


    def edit 
        @review = Review.find(params[:id])
        if @review.user_id == current_user.id 
            render :edit 
        else 
            redirect_to reviews_path
        end 
    end 

    def update 
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to reviews_path(@review)
    end

    def destroy 
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to reviews_path 
    end 


    private

    def review_params 
        params.require(:review).permit(:comment, :photographer_id)
    end 

end 