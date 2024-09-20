class ProfilesController < ApplicationController
  before_action :authorize_admin
  before_action :set_user, only: %i[new create show edit update destroy]
  before_action :set_profile, only: %i[show edit update destroy]

  def new
    @profile = @user.build_profile
  end

  def create
    @profile = @user.build_profile(profile_params)
    if @profile.save
      redirect_to user_profile_path(@user, @profile), notice: "Profile was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      puts "profile_params: #{profile_params}"
      redirect_to user_profile_path(@user, @profile), notice: "Profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to users_path, notice: "Profile was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_profile
    @profile = @user.profile
  end

  def profile_params
    params.require(:profile).permit(:status, :role, :notes, :first_name, :last_name, :avatar)
  end

  def authorize_admin
    redirect_to root_path, alert: "Access denied!" unless current_user&.profile&.admin?
  end
end
