class BriquettesController < ApplicationController
  before_action :authorize_admin
  before_action :set_shift
  before_action :set_briquette, only: %i[show edit update destroy]

  def new
    @briquette = @shift.briquettes.build
  end

  def create
    @briquette = @shift.briquettes.build(briquette_params)
    if @briquette.save
      redirect_to shift_briquette_path(@shift, @briquette), notice: "Briquette shift was successfully created."
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
      redirect_to shift_briquette_path(@shift, @briquette), notice: "Briquette shift was successfully updated."
    else
      render :edit
    end
  end

  def index
    @briquettes = Briquette.order(updated_at: :desc)
    @pagy, @briquettes = pagy(@briquettes)
  end

  def destroy
    @briquette.destroy
    redirect_to briquettes_path, notice: "Briquette shift was successfully destroyed."
  end

  private

  def set_shift
    @shift = Shift.find(params[:shift_id])
  end

  def set_briquette
    @briquette = @shift.briquette
  end

  def briquette_params
    params.require(:briquette).permit(:shift_id, :measurement_time, :briquette_speed, :bop_or_blast, :dry_material, :wet_bentonite, :pug_mill_one_amp, :water, :tons_per_hour, :briquette_moisture, :pug_mill_two_amp, :bulk_density, :lime, :molasses, :status, :notes)
  end

  def authorize_admin
    redirect_to root_path, alert: "Access denied!" unless current_user&.profile&.admin?
  end
end
