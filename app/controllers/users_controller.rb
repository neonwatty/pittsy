class UsersController < ApplicationController
  before_action :authorize_admin
  before_action :set_user, only: [ :edit, :update ]


  def index
    @users = User.order(created_at: :asc)
    @pagy, @users = pagy(@users)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User was successfully updated."
    else
      # print error messages
      puts "Error: " + @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def edit
  end

  def set_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :notes, :status)
  end

  def authorize_admin
    redirect_to root_path, alert: "Access denied!" unless current_user&.admin?
  end
end
