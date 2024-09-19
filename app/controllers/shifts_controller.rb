class ShiftsController < ApplicationController
  before_action :authorize_admin
  before_action :set_user
  before_action :set_shift, only: %i[show edit update destroy]


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
    @shift.destroy
    redirect_to shifts_path, notice: "Profile was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_shift
    @shift = @user.shift
  end

  def shift_params
    params.require(:shift).permit(:date, :shift_number, :job_type, :status, :notes)
  end
end
