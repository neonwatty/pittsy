class ShiftsController < ApplicationController
  before_action :authorize_admin

  def index
    @shifts = Shift.order(created_at: :asc)
    @pagy, @shifts = pagy(@shifts)
  end

  def new
    @shift = User.build_shift
  end

  def create
    @shift = User.build_shift(shift_params)
    if @shift.save
      redirect_to shift_path(@shift), notice: "Shift was successfully created."
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
      redirect_to shift_path(@shift), notice: "Shift was successfully updated."
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def shift_params
    params.require(:shift).permit(:date, :shift_num, :job_type)
  end
end
