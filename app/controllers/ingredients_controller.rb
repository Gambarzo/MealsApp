class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.create(ingredient_params)
    redirect_to recipe_path(@recipe)
  end
 
  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity, :unit)
    end
  
end
