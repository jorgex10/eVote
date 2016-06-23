class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_admin!
  before_action :set_controller

  def set_controller
    @controller = params[:controller]
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end
