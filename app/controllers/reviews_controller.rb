class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        # if params[:user_id] && @user = User.find_by_id(params[:user_id])
        #     @user.reviews
        # else
        #     flash[:message] = "That user doesn't exist. Please try again"
        #     redirect_to recipes_path
        # end


        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @reviews = @user.reviews
        else
            @reviews = Review.all
        end
    end
    
    def new
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id]) #can use build to chain these
            @review = Review.new(recipe_id: params[:recipe_id])
        else
            flash[:message] = "Error. That recipe was not found" if params[:recipe_id]
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)

        if @review.save
            redirect_to recipe_path(@review.recipe_id)
        else
            flash[:message] = "Review could not be added. Please try again"
            redirect_to new_review_path
        end
    end

    def show
        @review = Review.find(params[:id])
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
