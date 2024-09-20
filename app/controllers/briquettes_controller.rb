class BriquettesController < ApplicationController
  before_action :set_briquette, only: %i[show edit update destroy]

  def new
    @briquette = Briquette.new
  end

  def create
    @briquette = Briquette.new(briquette_params)

    if @briquette.save
      redirect_to @briquette, notice: "Briquette dataopint was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @briquette.update(briquette_params)
      redirect_to @briquette, notice: "Briquette datapoint was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_briquette
    @briquette = Briquette.find(params[:id])
  end

  def briquette_params
    params.require(:briquette).permit(:shift_id, :measurement_time, :briquette_speed, :bop_or_blast, :dry_material, :wet_bentonite, :pug_mill_one_amp, :water, :tons_per_hour, :briquette_moisture, :pug_mill_two_amp, :bulk_density, :lime, :molasses)
  end
end
