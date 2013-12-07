class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :remove_ingredient_from_recipe, :remove_gadget_from_recipe]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    ingredients_list
    gadgets_list
  end

  # GET /recipes/1/edit
  def edit
    ingredients_list
    gadgets_list
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    recipe_ingredients
    recipe_gadgets

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json

  def update    
    if @recipe.update(recipe_params)
      recipe_ingredients
      recipe_gadgets
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render action: 'edit' 
    end
  end
  
  def remove_ingredient_from_recipe
   IngredientsRecipe.find_by(:recipe_id =>params[:id], :ingredient_id => params[:ingredient_id]).destroy
   redirect_to @recipe, notice: 'Recipe was successfully updated.' 
  end


  def remove_gadget_from_recipe
   GadgetsRecipe.find_by(:recipe_id =>params[:id], :gadget_id => params[:gadget_id]).destroy
   redirect_to @recipe, notice: 'Recipe was successfully updated.' 
  end
  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :process, :vegetarian, :ingredients =>{}, :gadgets =>{})
    end

    # Creates an array of all ingredients
    def ingredients_list
     @ingredients = Ingredient.all.collect { |p| [ p.name, p.id ]}
    end

    # Creates an array of all gadgets
    def gadgets_list
     @gadgets = Gadget.all.collect { |p| [ p.name, p.id ]}
    end

    # Creates an array of ingredients in a recipe
    def recipe_ingredients
      params[:recipe][:ingredients].each do |ingredient_id|
        next if ingredient_id.to_i == 0
        ingredient = Ingredient.find(ingredient_id.to_i)
        @recipe.ingredients << ingredient
      end
    end

    # Creates an array of gadgets in a recipe
    def recipe_gadgets
      params[:recipe][:gadgets].each do |gadget_id|
        next if gadget_id.to_i == 0
        gadget = Gadget.find(gadget_id.to_i)
        @recipe.gadgets << gadget
      end
    end
end
