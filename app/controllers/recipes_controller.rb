class RecipesController < ApplicationController
    def index
        if logged_in?
            @recipes = Recipe.all
        else
            flash[:message] = "Please log in or sign up"
            redirect_to '/'
        end
    end
    
    def new
        if logged_in?
            @recipe = Recipe.new
        else
            flash[:message] = "Please log in or sign up"
            redirect_to '/'
        end
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to recipes_path
        else
            flash[:message] = "Recipe was not added. Please make sure all of the fields are entered"
            redirect_to new_recipe_path
        end
    end

    def show
        if logged_in?
            @recipe = Recipe.find(params[:id])
        else
            redirect_to '/'
        end
    end

    def edit
        if logged_in?
            @recipe = Recipe.find(params[:id])

            if @recipe.user_id != current_user.id
                flash[:message] = "Error. You are not able to edit other user's recipes."
                redirect_to recipes_path
            end
        else
            render :edit
        end
    end

    def update
        @recipe = Recipe.find(params[:id])

        if @recipe
            @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            flash[:message] = "Recipe was not updated. Please make sure all of the fields are entered"
            render :edit 
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.delete
        redirect_to recipes_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :instructions)
    end

end
