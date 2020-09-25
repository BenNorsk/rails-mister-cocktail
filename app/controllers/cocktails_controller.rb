class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params["id"])
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
  end

  def create
    # dose_hash = params["doses"]
    # @dose = Dose.new(dose_hash)
    # @dose.save
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit
    @cocktail = Cocktail.find(params["id"])
  end

  def update
    @cocktail = Cocktail.find(params["id"])
    #find_doses(params)
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params["id"])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, doses_attributes: [:id, :description, :ingredient_id, :_destroy])
  end

end

