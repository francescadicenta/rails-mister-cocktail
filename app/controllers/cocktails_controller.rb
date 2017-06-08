class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: "Success!"
    else
      render :new
    end
    # if your form is well written and so saved, redirect to his page with a notice
    # if not saved, render a new form to try again
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end

