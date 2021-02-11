class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end
    
    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        binding.pry
        if @recipe.save
            redirect_to recipes_path
        else
            flash[:message] = "Recipe was not added. Please make sure all of the fields are entered"
            render :new 
        end

    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :instructions)
    end
end
