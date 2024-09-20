class ShiftsController < ApplicationController
  before_action :authorize_admin
  before_action :set_user, only: %i[new create show edit update destroy]
  before_action :set_shift, only: %i[show edit update destroy]

  def new
    @shift = @user.shifts.build
  end

  def create
    @shift = @user.shifts.build(shift_params)
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
      redirect_to user_shift_path(@shift.user, @shift), notice: "shift was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to shifts_path, notice: "shift was successfully destroyed."
  end

  def index
    @shifts = Shift.order(updated_at: :desc)
    @pagy, @shifts = pagy(@shifts)
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_shift
    @shift = @user.shifts.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:date, :shift_number, :job_type, :status, :notes, :user_id)
  end

  def authorize_admin
    redirect_to root_path, alert: "Access denied!" unless current_user&.profile&.admin?
  end
end
