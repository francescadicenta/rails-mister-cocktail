class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # @dose.cocktail = @cocktail ??????????
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    # a dose is associated to the cocktail id !!
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail), notice: "Success!"
      # we need to redirect on this dose we just created and not on the cocktail before
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path, notice: "Deleted with success!"
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
    # on permet juste de modifier la descrip e l'ingred
    # pas tout, donc on aura permitted = false
  end
end

# here needs to be connected to cocktails!
