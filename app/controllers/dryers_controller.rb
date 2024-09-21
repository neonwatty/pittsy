class DryersController < ApplicationController
  before_action :authorize_admin
  before_action :set_shift
  before_action :set_single_dryer, only: %i[show edit update destroy]
  before_action :set_dryers, only: %i[index]

  def new
    @dryer = @shift.dryers.build
  end

  def create
    @dryer = @shift.dryers.build(dryer_params)
    if @dryer.save
      redirect_to shift_dryer_path(@shift, @dryer), notice: "dryer shift was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    # add status to params
    dryer_params[:status] = @dryer.status

    if @dryer.update(dryer_params)
      redirect_to shift_dryer_path(@shift, @dryer), notice: "dryer shift was successfully updated."
    else
      flash[:alert] = "Failure: dryer shift was not successfully updated. Errors: #{ @dryer.errors.full_messages.join(', ') }"
      redirect_to shift_dryer_path(@shift, @dryer)
    end
  end

  def index
    @dryers = @dryers
    @pagy, @dryers = pagy(@dryers)
  end

  def destroy
    @dryer.destroy
    redirect_to dryers_path, notice: "dryer shift was successfully destroyed."
  end

  private

  def set_shift
    @shift = Shift.find(params[:shift_id])
  end

  def set_single_dryer
    @dryer = @shift.dryers.find_by(id: params[:id])
  end

  def set_dryers
    @dryers = @shift.dryers
  end

  def dryer_params
    params.require(:dryer).permit(:shift_id, :measurement_time, :material_rate_bin_a, :cyclone_photo, :control_setpoint, :control_temp, :gas_valve_position, :background_temp, :baghouse_temp, :baghouse_fan_amp, :material_moisture, :air_compression, :status, :notes)
  end

  def authorize_admin
    redirect_to root_path, alert: "Access denied!" unless current_user&.profile&.admin?
  end
end
