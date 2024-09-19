class UsersController < ApplicationController
  before_action :authorize_admin

  def index
    @users = User.order(created_at: :asc)
    @pagy, @users = pagy(@users)
  end
end
