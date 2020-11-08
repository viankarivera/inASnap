class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        #byebug
       if params[:photographer_id] && @photographer = Photographer.find_by_id(params[:photographer_id])
         @reviews = @photographer.reviews 
        else 
        @reviews = Review.alphabetize
      end 
    
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

        if @review.save
            redirect_to photographer_reviews_path(params[:photographer_id])
        else
            flash[:message] = "Comment can't be blank."
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
            redirect_to user_path(current_user)
        end 
    end 

    def update 
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to user_path(current_user)
    end

    def destroy 
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to user_path(current_user) 
    end 


    private

    def review_params 
        params.require(:review).permit(:comment, :photographer_id)
    end 

end 