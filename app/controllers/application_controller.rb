class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Pagy::Backend

  before_action :authenticate_user!

  def authorize_admin
    redirect_to root_path, alert: "Access denied!" unless current_user&.admin?
  end

  def not_found
    redirect_to root_path
  end
end
