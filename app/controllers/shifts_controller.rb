class ShiftsController < ApplicationController
  before_action :authorize_admin
  before_action :set_shift, only: %i[show edit update destroy]
  before_save :create_briquettes

  def index
    @shifts = Shift.order(updated_at: :asc)
    @pagy, @shifts = pagy(@shifts)
  end


  def new
    @shift = @user.build_shift
  end

  def create
    @shift = @user.build_shift(shift_params)
    if @shift.save
      redirect_to shifts_path, notice: "shift was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      puts "shift_params: #{shift_params}"
      redirect_to shift_path(@shift), notice: "shift was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to shifts_path, notice: "shift was successfully destroyed."
  end

  private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:date, :shift_number, :job_type, :status, :notes, :user_id)
  end

  def authorize_admin
    redirect_to root_path, alert: "Access denied!" unless current_user&.profile&.admin?
  end

  # create 8 briquettes for each shift
  def create_briquettes
   8.times do
   Briquette.create(shift_id: @shift)
   end
  end
end
