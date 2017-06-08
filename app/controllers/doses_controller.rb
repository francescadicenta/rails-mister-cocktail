class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
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
  end
end

# here needs to be connected to cocktails!
