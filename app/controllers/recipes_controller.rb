class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end
    
    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)

        if @recipe.save

            if !params[:recipe][:name] || !params[:recipe][:ingredients] || !params[:recipe][:instructions]
                redirect_to recipe_path(@recipe.id)
            end

        else
            flash[:message] = "Recipe was not added. Please make sure all of the fields are entered"
            render :new 
        end
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def edit
        @recipe = Recipe.find(params[:id])
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
