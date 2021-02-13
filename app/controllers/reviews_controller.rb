class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    def create
        @recipe = Recipe.find(params[:review][:recipe_id])
        @review = Review.new(review_params)
        @review.user_id = current_user.id #maybe I can add this step in the review params as a default value..
        
        if @review.save
            redirect_to recipe_path(@review.recipe_id)
        else
            flash[:message] = "Review could not be added. Please try again"
            redirect_to new_review_path
        end

    end

    private

    def review_params
        params.require(:review).permit(:content, :user_id, :recipe_id)
    end

end
