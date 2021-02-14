class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @user.reviews
        else
            flash[:message] = "That user doesn't exist. Please try again"
            redirect_to recipes_path
        end
    end
    
    def new
        @review = Review.new(recipe_id: params[:recipe_id])
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id #maybe I can add this step in the review params as a default value..
        @user = User.find(@review.user_id)
        
        if @review.save

            redirect_to recipe_path(@review.recipe_id)
        else
            flash[:message] = "Review could not be added. Please try again"
            redirect_to new_review_path
        end
    end

    def show
        @review = Review.find(params[:id])
        @recipe = Recipe.find(@review.recipe_id)
        @user = User.find(@review.user_id)
    end

    def destroy
        @review = Review.find(params[:id])
        @review.delete
        flash[:message] = "Your review has been successfully deleted"
        redirect_to recipes_path
    end

    private

    def review_params
        params.require(:review).permit(:content, :user_id, :recipe_id)
    end

end
